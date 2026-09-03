import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/lidarr.dart';
import '../../domain/usecases/lidarr_usecases.dart';

part 'lidarr_bloc.freezed.dart';

@freezed
class LidarrEvent with _$LidarrEvent {
  const factory LidarrEvent.searchRequested(String query) = SearchRequested;
  const factory LidarrEvent.artistRequested(LidarrArtist artist) = ArtistRequested;
}

@freezed
class LidarrState with _$LidarrState {
  const factory LidarrState.initial() = LidarrInitial;
  const factory LidarrState.loading() = LidarrLoading;
  const factory LidarrState.artistsLoaded(List<LidarrArtist> artists) = ArtistsLoaded;
  const factory LidarrState.error(String message) = LidarrError;
  const factory LidarrState.success(String message) = LidarrSuccess;
}

class LidarrBloc extends Bloc<LidarrEvent, LidarrState> {
  final SearchArtistsUseCase searchArtists;
  final GetLibraryArtistsUseCase getLibraryArtists;
  final RequestArtistUseCase requestArtist;
  final GetAlbumsUseCase getAlbums;
  final LookupAlbumsUseCase lookupAlbums;
  final GetTracksUseCase getTracks;
  final SearchAlbumUseCase searchAlbum;
  final SearchArtistDiscographyUseCase searchArtistDiscography;

  bool lastLoadWasSearch = false;
  List<LidarrArtist> lastArtists = const [];
  String? pendingAlbumsArtistName;
  final Set<String> pendingSearchAlbumIds = {};

  LidarrBloc({
    required this.searchArtists,
    required this.getLibraryArtists,
    required this.requestArtist,
    required this.getAlbums,
    required this.lookupAlbums,
    required this.getTracks,
    required this.searchAlbum,
    required this.searchArtistDiscography,
  }) : super(const LidarrInitial()) {
    on<SearchRequested>(_onSearchRequested);
    on<ArtistRequested>(_onArtistRequested);
  }

  Future<void> _onSearchRequested(SearchRequested event, Emitter<LidarrState> emit) async {
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

  Future<void> _onArtistRequested(ArtistRequested event, Emitter<LidarrState> emit) async {
    final currentArtists = lastArtists;
    try {
      final added = await requestArtist.execute(event.artist);
      emit(LidarrSuccess('${added.artistName} adicionado à biblioteca.'));

      final updatedArtists = currentArtists.map((a) {
        if (a.mbid == added.mbid) return added;
        return a;
      }).toList();
      lastArtists = updatedArtists;
      emit(ArtistsLoaded(updatedArtists));
    } catch (e) {
      final message = e is Exception ? e.toString().replaceFirst('Exception: ', '') : e.toString();
      emit(LidarrError(message));
      if (currentArtists.isNotEmpty) {
        emit(ArtistsLoaded(currentArtists));
      }
    }
  }

  Future<List<LidarrAlbum>> fetchAlbums(String artistKey) async {
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

    if (album.availabilityLabel == 'DOWNLOADED') {
      pendingSearchAlbumIds.remove(albumId);
      return album;
    }

    if (album.isQueued || pendingSearchAlbumIds.contains(albumId)) {
      return album.copyWith(isQueued: true);
    }

    return album;
  }

  Future<List<LidarrTrack>> fetchTracks(String albumId, {bool isQueued = false}) {
    final queued = isQueued || pendingSearchAlbumIds.contains(albumId);
    return getTracks.execute(albumId, isQueued: queued);
  }

  Future<void> triggerAlbumSearch(String albumId) async {
    pendingSearchAlbumIds.add(albumId);
    try {
      await searchAlbum.execute(albumId);
    } catch (e) {
      pendingSearchAlbumIds.remove(albumId);
      rethrow;
    }
  }

  Future<void> triggerDiscographySearch(String artistId) async {
    await searchArtistDiscography.execute(artistId);
    final albums = await getAlbums.execute(artistId);
    for (final album in albums) {
      if (album.id != null && album.availabilityLabel != 'DOWNLOADED') {
        pendingSearchAlbumIds.add(album.id!);
      }
    }
  }
}
