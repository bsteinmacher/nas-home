import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/lidarr.dart';
import '../../domain/usecases/lidarr_usecases.dart';

part 'lidarr_bloc.freezed.dart';

@freezed
class LidarrEvent with _$LidarrEvent {
  const factory LidarrEvent.searchRequested(String query) = SearchRequested;
  const factory LidarrEvent.artistRequested(LidarrArtist artist) =
      ArtistRequested;
  const factory LidarrEvent.searchStatusChanged(
    List<String> albumIds,
    String status,
    String message,
  ) = SearchStatusChanged;
}

@freezed
class LidarrState with _$LidarrState {
  const factory LidarrState.initial() = LidarrInitial;
  const factory LidarrState.loading() = LidarrLoading;
  const factory LidarrState.artistsLoaded(List<LidarrArtist> artists) =
      ArtistsLoaded;
  const factory LidarrState.error(String message) = LidarrError;
  const factory LidarrState.success(String message) = LidarrSuccess;
  const factory LidarrState.searchUpdated(
    List<String> albumIds,
    String status,
    String message,
  ) = LidarrSearchUpdated;
}

class LidarrBloc extends Bloc<LidarrEvent, LidarrState> {
  static const _pendingSearchesKey = 'lidarr_pending_searches_v1';

  final SearchArtistsUseCase searchArtists;
  final GetLibraryArtistsUseCase getLibraryArtists;
  final RequestArtistUseCase requestArtist;
  final GetAlbumsUseCase getAlbums;
  final GetAlbumUseCase getAlbum;
  final LookupAlbumsUseCase lookupAlbums;
  final GetTracksUseCase getTracks;
  final SearchAlbumUseCase searchAlbum;
  final SearchArtistDiscographyUseCase searchArtistDiscography;
  final GetLidarrCommandStatusUseCase getCommandStatus;
  final SharedPreferences sharedPreferences;

  bool lastLoadWasSearch = false;
  List<LidarrArtist> lastArtists = const [];
  String? pendingAlbumsArtistName;
  final Set<String> pendingSearchAlbumIds = {};
  final Map<String, _PendingLidarrSearch> _pendingSearches = {};
  final Set<String> _monitoredCommandIds = {};
  Future<void>? _restoreFuture;

  LidarrBloc({
    required this.searchArtists,
    required this.getLibraryArtists,
    required this.requestArtist,
    required this.getAlbums,
    required this.getAlbum,
    required this.lookupAlbums,
    required this.getTracks,
    required this.searchAlbum,
    required this.searchArtistDiscography,
    required this.getCommandStatus,
    required this.sharedPreferences,
  }) : super(const LidarrInitial()) {
    on<SearchRequested>(_onSearchRequested);
    on<ArtistRequested>(_onArtistRequested);
    on<SearchStatusChanged>(_onSearchStatusChanged);
  }

  void _onSearchStatusChanged(
    SearchStatusChanged event,
    Emitter<LidarrState> emit,
  ) {
    emit(LidarrSearchUpdated(event.albumIds, event.status, event.message));
  }

  Future<void> _onSearchRequested(
    SearchRequested event,
    Emitter<LidarrState> emit,
  ) async {
    final trimmedQuery = event.query.trim();
    final hasCachedArtists = lastArtists.isNotEmpty;

    if (!hasCachedArtists) {
      emit(const LidarrLoading());
    }

    try {
      if (trimmedQuery.isEmpty) {
        final artists = await getLibraryArtists.execute();
        lastArtists = artists;
        lastLoadWasSearch = false;
        emit(ArtistsLoaded(artists));
        return;
      }

      final artists = await searchArtists.execute(trimmedQuery);
      lastArtists = artists;
      lastLoadWasSearch = true;
      emit(ArtistsLoaded(artists));
    } catch (e) {
      if (lastArtists.isNotEmpty) {
        emit(ArtistsLoaded(lastArtists));
      } else {
        emit(LidarrError(e.toString()));
      }
    }
  }

  Future<void> _onArtistRequested(
    ArtistRequested event,
    Emitter<LidarrState> emit,
  ) async {
    final currentArtists = lastArtists;
    late final LidarrArtist added;
    try {
      added = await requestArtist.execute(event.artist);
    } catch (e) {
      final message =
          e is Exception
              ? e.toString().replaceFirst('Exception: ', '')
              : e.toString();
      emit(LidarrError(message));
      if (currentArtists.isNotEmpty) {
        emit(ArtistsLoaded(currentArtists));
      }
      return;
    }

    emit(LidarrSuccess('${added.artistName} adicionado à biblioteca.'));
    final updatedArtists =
        currentArtists.map((artist) {
          if (artist.mbid == added.mbid) return added;
          return artist;
        }).toList();
    lastArtists = updatedArtists;
    emit(ArtistsLoaded(updatedArtists));

    final artistId = added.id;
    if (artistId == null) return;
    try {
      await triggerDiscographySearch(artistId);
    } catch (e) {
      final message = e.toString().replaceFirst('Exception: ', '');
      emit(
        LidarrError(
          '${added.artistName} foi adicionado, mas a busca falhou: $message',
        ),
      );
      emit(ArtistsLoaded(updatedArtists));
    }
  }

  Future<List<LidarrAlbum>> fetchAlbums(String artistKey) async {
    await _ensurePendingSearchesLoaded();
    final List<LidarrAlbum> albums;
    if (int.tryParse(artistKey) != null) {
      albums = await getAlbums.execute(artistKey);
    } else {
      final artistName = pendingAlbumsArtistName ?? '';
      pendingAlbumsArtistName = null;
      albums = await lookupAlbums.execute(artistKey, artistName);
    }

    return albums.map(_applySearchState).toList();
  }

  LidarrAlbum _applySearchState(LidarrAlbum album) {
    final albumId = album.id;
    if (albumId == null) return album;

    final isDownloaded = album.availabilityLabel == 'DOWNLOADED';
    return album.copyWith(
      isSearching:
          !isDownloaded &&
          !album.isQueued &&
          pendingSearchAlbumIds.contains(albumId),
    );
  }

  Future<List<LidarrTrack>> fetchTracks(
    String albumId, {
    bool isQueued = false,
  }) {
    return getTracks.execute(albumId, isQueued: isQueued);
  }

  Future<LidarrAlbum> fetchAlbum(String albumId) async {
    await _ensurePendingSearchesLoaded();
    return _applySearchState(await getAlbum.execute(albumId));
  }

  Future<void> triggerAlbumSearch(String albumId) async {
    await _ensurePendingSearchesLoaded();
    final command = await searchAlbum.execute(albumId);
    if (command.isFailed) {
      throw Exception(command.message ?? 'O Lidarr recusou a busca do álbum.');
    }

    final pending = _PendingLidarrSearch(
      commandId: command.id,
      albumIds: [albumId],
      createdAt: DateTime.now(),
    );
    await _registerPendingSearch(pending);
    _notifySearch(pending.albumIds, 'searching', 'Busca enviada ao Lidarr.');
    unawaited(_monitorCommand(pending));
  }

  Future<void> triggerDiscographySearch(String artistId) async {
    final albums = await _waitForArtistAlbums(artistId);
    if (albums.isEmpty) {
      throw Exception('O Lidarr ainda não carregou os álbuns do artista.');
    }
    final albumIds =
        albums
            .where(
              (album) =>
                  album.id != null && album.availabilityLabel != 'DOWNLOADED',
            )
            .map((album) => album.id!)
            .toList();
    if (albumIds.isEmpty) {
      throw Exception('A discografia disponível já está baixada.');
    }

    final command = await searchArtistDiscography.execute(artistId);
    if (command.isFailed) {
      throw Exception(
        command.message ?? 'O Lidarr recusou a busca da discografia.',
      );
    }

    final pending = _PendingLidarrSearch(
      commandId: command.id,
      albumIds: albumIds,
      artistId: artistId,
      createdAt: DateTime.now(),
    );
    await _registerPendingSearch(pending);
    _notifySearch(
      pending.albumIds,
      'searching',
      'Busca da discografia enviada ao Lidarr.',
    );
    unawaited(_monitorCommand(pending));
  }

  Future<List<LidarrAlbum>> _waitForArtistAlbums(String artistId) async {
    var albums = <LidarrAlbum>[];
    for (var attempt = 0; attempt < 5; attempt++) {
      albums = await getAlbums.execute(artistId);
      if (albums.isNotEmpty) return albums;
      if (attempt < 4) {
        await Future<void>.delayed(const Duration(seconds: 1));
      }
    }
    return albums;
  }

  Future<void> _ensurePendingSearchesLoaded() {
    return _restoreFuture ??= _restorePendingSearches();
  }

  Future<void> _restorePendingSearches() async {
    final encoded = sharedPreferences.getString(_pendingSearchesKey);
    if (encoded == null || encoded.isEmpty) return;

    try {
      final rawItems = jsonDecode(encoded) as List;
      final staleBefore = DateTime.now().subtract(const Duration(hours: 24));
      for (final raw in rawItems.whereType<Map>()) {
        final pending = _PendingLidarrSearch.fromJson(
          Map<String, dynamic>.from(raw),
        );
        if (pending.createdAt.isBefore(staleBefore)) continue;
        _pendingSearches[pending.commandId] = pending;
        pendingSearchAlbumIds.addAll(pending.albumIds);
        unawaited(_monitorCommand(pending));
      }
      await _persistPendingSearches();
    } catch (_) {
      await sharedPreferences.remove(_pendingSearchesKey);
    }
  }

  Future<void> _registerPendingSearch(_PendingLidarrSearch pending) async {
    _pendingSearches[pending.commandId] = pending;
    pendingSearchAlbumIds.addAll(pending.albumIds);
    await _persistPendingSearches();
  }

  Future<void> _persistPendingSearches() async {
    final encoded = jsonEncode(
      _pendingSearches.values.map((pending) => pending.toJson()).toList(),
    );
    await sharedPreferences.setString(_pendingSearchesKey, encoded);
  }

  Future<void> _monitorCommand(_PendingLidarrSearch pending) async {
    if (!_monitoredCommandIds.add(pending.commandId)) return;

    try {
      var consecutiveErrors = 0;
      for (var attempt = 0; attempt < 60; attempt++) {
        try {
          final command = await getCommandStatus.execute(pending.commandId);
          consecutiveErrors = 0;
          if (command.isTerminal) {
            await _finishSearch(pending, command);
            return;
          }
        } catch (_) {
          consecutiveErrors++;
          if (consecutiveErrors >= 3) return;
        }
        await Future<void>.delayed(const Duration(seconds: 2));
      }
    } finally {
      _monitoredCommandIds.remove(pending.commandId);
    }
  }

  Future<void> _finishSearch(
    _PendingLidarrSearch pending,
    LidarrCommand command,
  ) async {
    if (command.isFailed) {
      await _removePendingSearch(pending);
      _notifySearch(
        pending.albumIds,
        'failed',
        command.message ?? 'A busca falhou no Lidarr.',
      );
      return;
    }

    await Future<void>.delayed(const Duration(seconds: 2));
    final outcome = await _resolveSearchOutcome(pending);
    await _removePendingSearch(pending);
    _notifySearch(pending.albumIds, outcome.status, outcome.message);
  }

  Future<_SearchOutcome> _resolveSearchOutcome(
    _PendingLidarrSearch pending,
  ) async {
    for (var attempt = 0; attempt < 5; attempt++) {
      final albums =
          pending.artistId != null
              ? await getAlbums.execute(pending.artistId!)
              : [await getAlbum.execute(pending.albumIds.single)];
      final requested =
          albums
              .where(
                (album) =>
                    album.id != null && pending.albumIds.contains(album.id!),
              )
              .toList();
      final downloading = requested.where((album) => album.isQueued).length;
      final downloaded =
          requested
              .where((album) => album.availabilityLabel == 'DOWNLOADED')
              .length;

      if (downloading > 0) {
        return _SearchOutcome(
          'downloading',
          downloading == 1
              ? 'Download iniciado pelo Lidarr.'
              : '$downloading downloads iniciados pelo Lidarr.',
        );
      }
      if (downloaded > 0) {
        return _SearchOutcome(
          'downloaded',
          downloaded == 1
              ? 'Álbum baixado e importado.'
              : '$downloaded álbuns baixados e importados.',
        );
      }
      if (attempt < 4) {
        await Future<void>.delayed(const Duration(seconds: 2));
      }
    }

    return const _SearchOutcome(
      'not_found',
      'A busca terminou, mas nenhuma release compatível foi encontrada.',
    );
  }

  Future<void> _removePendingSearch(_PendingLidarrSearch pending) async {
    _pendingSearches.remove(pending.commandId);
    pendingSearchAlbumIds.removeAll(pending.albumIds);
    await _persistPendingSearches();
  }

  void _notifySearch(List<String> albumIds, String status, String message) {
    if (!isClosed) {
      add(SearchStatusChanged(albumIds, status, message));
    }
  }
}

class _PendingLidarrSearch {
  final String commandId;
  final List<String> albumIds;
  final String? artistId;
  final DateTime createdAt;

  const _PendingLidarrSearch({
    required this.commandId,
    required this.albumIds,
    required this.createdAt,
    this.artistId,
  });

  factory _PendingLidarrSearch.fromJson(Map<String, dynamic> json) {
    return _PendingLidarrSearch(
      commandId: json['commandId'] as String,
      albumIds: (json['albumIds'] as List).cast<String>(),
      artistId: json['artistId'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'commandId': commandId,
    'albumIds': albumIds,
    'artistId': artistId,
    'createdAt': createdAt.toIso8601String(),
  };
}

class _SearchOutcome {
  final String status;
  final String message;

  const _SearchOutcome(this.status, this.message);
}
