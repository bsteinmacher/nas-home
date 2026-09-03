import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/lidarr.dart';

class _LidarrAddConfig {
  final String rootFolderPath;
  final int qualityProfileId;
  final int metadataProfileId;

  const _LidarrAddConfig({
    required this.rootFolderPath,
    required this.qualityProfileId,
    required this.metadataProfileId,
  });
}

abstract class LidarrDataSource {
  Future<List<LidarrArtist>> searchArtists(String query);
  Future<List<LidarrArtist>> getLibraryArtists();
  Future<LidarrArtist> requestArtist(LidarrArtist artist);
  Future<List<LidarrAlbum>> getAlbums(String artistId);
  Future<List<LidarrAlbum>> lookupAlbums(String artistMbid, String artistName);
  Future<List<LidarrTrack>> getTracks(String albumId, {bool isQueued = false});
  Future<void> searchAlbum(String albumId);
  Future<void> searchArtistDiscography(String artistId);
}

class LidarrDataSourceImpl implements LidarrDataSource {
  final Dio dio;
  final SharedPreferences sharedPreferences;

  LidarrDataSourceImpl({
    required this.dio,
    required this.sharedPreferences,
  });

  _LidarrAddConfig? _addConfigCache;

  String get _baseUrl {
    String url = sharedPreferences.getString('nas_url') ?? '';
    if (!url.startsWith('http')) {
      url = 'http://$url';
    }
    if (url.endsWith('/')) {
      url = url.substring(0, url.length - 1);
    }
    final uri = Uri.parse(url);
    return '${uri.scheme}://${uri.host}';
  }

  String get _apiKey => sharedPreferences.getString('lidarr_api_key') ?? '';

  Options get _authOptions => Options(headers: {'X-Api-Key': _apiKey});

  @override
  Future<List<LidarrArtist>> searchArtists(String query) async {
    final trimmedQuery = query.trim();
    if (trimmedQuery.isEmpty) return [];

    final response = await dio.get(
      '$_baseUrl:8686/api/v1/artist/lookup',
      queryParameters: {'term': trimmedQuery},
      options: _authOptions,
    );

    final libraryByMbid = await _fetchLibraryByMbid();
    final seenMbids = <String>{};
    final artists = <LidarrArtist>[];

    for (final raw in response.data as List) {
      final mapped = _mapToLidarrArtist(raw as Map<String, dynamic>);
      final mbid = mapped.mbid;
      if (mbid != null && !seenMbids.add(mbid)) continue;

      final inLibrary = mbid != null ? libraryByMbid[mbid] : null;
      if (inLibrary != null) {
        artists.add(inLibrary.copyWith(
          disambiguation: mapped.disambiguation ?? inLibrary.disambiguation,
          remotePoster: inLibrary.remotePoster ?? mapped.remotePoster,
        ));
      } else {
        artists.add(mapped);
      }
    }

    await _enrichArtistsWithLookupCovers(artists);
    return artists;
  }

  @override
  Future<List<LidarrArtist>> getLibraryArtists() async {
    final response = await dio.get(
      '$_baseUrl:8686/api/v1/artist',
      options: _authOptions,
    );

    final results = (response.data as List).cast<Map<String, dynamic>>();
    results.sort((a, b) {
      final aDate = a['added'] as String? ?? '';
      final bDate = b['added'] as String? ?? '';
      return bDate.compareTo(aDate);
    });

    final artists = results.map(_mapToLidarrArtist).toList();
    await _enrichArtistsWithAlbumCovers(artists);
    return artists;
  }

  Future<Map<String, LidarrArtist>> _fetchLibraryByMbid() async {
    final response = await dio.get(
      '$_baseUrl:8686/api/v1/artist',
      options: _authOptions,
    );

    final map = <String, LidarrArtist>{};
    for (final raw in response.data as List) {
      final artist = _mapToLidarrArtist(raw as Map<String, dynamic>);
      final mbid = artist.mbid;
      if (mbid != null) {
        map[mbid] = artist.copyWith(isAdded: true);
      }
    }
    return map;
  }

  Future<_LidarrAddConfig> _getAddConfig() async {
    if (_addConfigCache != null) return _addConfigCache!;

    final rootFolders = await dio.get(
      '$_baseUrl:8686/api/v1/rootfolder',
      options: _authOptions,
    );
    final qualityProfiles = await dio.get(
      '$_baseUrl:8686/api/v1/qualityprofile',
      options: _authOptions,
    );
    final metadataProfiles = await dio.get(
      '$_baseUrl:8686/api/v1/metadataprofile',
      options: _authOptions,
    );

    final roots = rootFolders.data as List;
    final qualities = qualityProfiles.data as List;
    final metadata = metadataProfiles.data as List;

    if (roots.isEmpty) {
      throw Exception('Nenhuma root folder configurada no Lidarr.');
    }
    if (qualities.isEmpty) {
      throw Exception('Nenhum quality profile configurado no Lidarr.');
    }
    if (metadata.isEmpty) {
      throw Exception('Nenhum metadata profile configurado no Lidarr.');
    }

    _addConfigCache = _LidarrAddConfig(
      rootFolderPath: roots.first['path'] as String,
      qualityProfileId: _readInt(qualities.first['id']) ?? 1,
      metadataProfileId: _readInt(metadata.first['id']) ?? 1,
    );
    return _addConfigCache!;
  }

  @override
  Future<LidarrArtist> requestArtist(LidarrArtist artist) async {
    if (artist.mbid == null || artist.mbid!.isEmpty) {
      throw Exception('Artista sem MusicBrainz ID.');
    }

    if (artist.isAdded) {
      throw Exception('${artist.artistName} já está na biblioteca.');
    }

    final config = await _getAddConfig();

    final lookupResponse = await dio.get(
      '$_baseUrl:8686/api/v1/artist/lookup/foreigner/${artist.mbid}',
      options: _authOptions,
    );

    final payload = Map<String, dynamic>.from(lookupResponse.data as Map<String, dynamic>);
    payload.remove('id');
    payload['rootFolderPath'] = config.rootFolderPath;
    payload['qualityProfileId'] = config.qualityProfileId;
    payload['metadataProfileId'] = config.metadataProfileId;
    payload['monitored'] = true;
    payload['addOptions'] = {
      'searchForMissingAlbums': true,
      'monitor': 'all',
    };

    try {
      final response = await dio.post(
        '$_baseUrl:8686/api/v1/artist',
        data: payload,
        options: _authOptions,
      );
      return _mapToLidarrArtist(response.data as Map<String, dynamic>).copyWith(isAdded: true);
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }

  @override
  Future<List<LidarrAlbum>> getAlbums(String artistId) async {
    final queuedAlbumIds = await _getQueuedAlbumIds(artistId);

    final response = await dio.get(
      '$_baseUrl:8686/api/v1/album',
      queryParameters: {'artistId': artistId},
      options: _authOptions,
    );

    final results = response.data as List;
    return results
        .map((e) {
          final album = _mapToLidarrAlbum(e as Map<String, dynamic>, isInLibrary: true);
          final albumId = int.tryParse(album.id ?? '');
          final isQueued = albumId != null && queuedAlbumIds.contains(albumId);
          return album.copyWith(isQueued: isQueued);
        })
        .toList()
      ..sort((a, b) => (b.releaseDate ?? '').compareTo(a.releaseDate ?? ''));
  }

  @override
  Future<List<LidarrTrack>> getTracks(String albumId, {bool isQueued = false}) async {
    final response = await dio.get(
      '$_baseUrl:8686/api/v1/track',
      queryParameters: {'albumId': albumId},
      options: _authOptions,
    );

    final results = response.data as List;
    return results
        .map((raw) {
          final track = raw as Map<String, dynamic>;
          return LidarrTrack(
            id: track['id']?.toString(),
            title: track['title'] as String? ?? 'Unknown Track',
            trackNumber: _readInt(track['trackNumber']) ?? 0,
            hasFile: track['hasFile'] as bool? ?? false,
            isQueued: isQueued,
          );
        })
        .toList()
      ..sort((a, b) => a.trackNumber.compareTo(b.trackNumber));
  }

  @override
  Future<void> searchAlbum(String albumId) async {
    final id = int.tryParse(albumId);
    if (id == null) throw Exception('Álbum inválido.');

    await _sendCommand('AlbumSearch', albumIds: [id]);
  }

  @override
  Future<void> searchArtistDiscography(String artistId) async {
    final id = int.tryParse(artistId);
    if (id == null) throw Exception('Artista inválido.');

    await _sendCommand('ArtistSearch', artistId: id);
  }

  Future<void> _sendCommand(
    String name, {
    List<int>? albumIds,
    int? artistId,
  }) async {
    final payload = <String, dynamic>{'name': name};
    if (albumIds != null) payload['albumIds'] = albumIds;
    if (artistId != null) payload['artistId'] = artistId;

    try {
      await dio.post(
        '$_baseUrl:8686/api/v1/command',
        data: payload,
        options: _authOptions,
      );
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }

  Future<Set<int>> _getQueuedAlbumIds(String artistId) async {
    try {
      final response = await dio.get(
        '$_baseUrl:8686/api/v1/queue',
        queryParameters: {
          'artistIds': artistId,
          'includeAlbum': true,
          'pageSize': 100,
        },
        options: _authOptions,
      );

      final data = response.data;
      final records = data is Map ? data['records'] as List? ?? [] : data as List;
      return records
          .map((item) => _readInt((item as Map)['albumId']))
          .whereType<int>()
          .toSet();
    } catch (_) {
      return {};
    }
  }

  @override
  Future<List<LidarrAlbum>> lookupAlbums(String artistMbid, String artistName) async {
    final response = await dio.get(
      '$_baseUrl:8686/api/v1/album/lookup',
      queryParameters: {'term': artistName},
      options: _authOptions,
    );

    final results = (response.data as List).cast<Map<String, dynamic>>();
    return results
        .where((album) => album['foreignArtistId'] == artistMbid)
        .map((e) => _mapToLidarrAlbum(e, isInLibrary: false))
        .toList()
      ..sort((a, b) => (b.releaseDate ?? '').compareTo(a.releaseDate ?? ''));
  }

  Future<void> _enrichArtistsWithLookupCovers(List<LidarrArtist> artists) async {
    const batchSize = 4;
    for (var i = 0; i < artists.length; i += batchSize) {
      final end = (i + batchSize < artists.length) ? i + batchSize : artists.length;
      final batch = artists.sublist(i, end);
      await Future.wait(
        batch.map((artist) async {
          if (artist.remotePoster != null || artist.mbid == null) return;
          final cover = await _latestAlbumCoverFromLookup(artist.mbid!, artist.artistName);
          if (cover != null) {
            final index = artists.indexOf(artist);
            artists[index] = artist.copyWith(remotePoster: cover);
          }
        }),
      );
    }
  }

  Future<String?> _latestAlbumCoverFromLookup(String artistMbid, String artistName) async {
    try {
      final response = await dio.get(
        '$_baseUrl:8686/api/v1/album/lookup',
        queryParameters: {'term': artistName},
        options: _authOptions,
      );

      final albums = (response.data as List)
          .cast<Map<String, dynamic>>()
          .where((album) => album['foreignArtistId'] == artistMbid)
          .toList();
      if (albums.isEmpty) return null;

      albums.sort((a, b) {
        final aDate = a['releaseDate'] as String? ?? '';
        final bDate = b['releaseDate'] as String? ?? '';
        return bDate.compareTo(aDate);
      });

      for (final album in albums) {
        final cover = _extractImageUrl(album['images'] as List?, preferredType: 'cover');
        if (cover != null) return cover;
      }
    } catch (_) {}

    return null;
  }

  Future<void> _enrichArtistsWithAlbumCovers(List<LidarrArtist> artists) async {
    const batchSize = 4;
    for (var i = 0; i < artists.length; i += batchSize) {
      final end = (i + batchSize < artists.length) ? i + batchSize : artists.length;
      final batch = artists.sublist(i, end);
      await Future.wait(
        batch.map((artist) async {
          if (artist.remotePoster != null || artist.id == null) return;
          final cover = await _latestAlbumCover(artist.id!) ??
              (artist.mbid != null
                  ? await _latestAlbumCoverFromLookup(artist.mbid!, artist.artistName)
                  : null);
          if (cover != null) {
            final index = artists.indexOf(artist);
            artists[index] = artist.copyWith(remotePoster: cover);
          }
        }),
      );
    }
  }

  Future<String?> _latestAlbumCover(String artistId) async {
    try {
      final response = await dio.get(
        '$_baseUrl:8686/api/v1/album',
        queryParameters: {'artistId': artistId},
        options: _authOptions,
      );

      final albums = (response.data as List).cast<Map<String, dynamic>>();
      if (albums.isEmpty) return null;

      albums.sort((a, b) {
        final aDate = a['releaseDate'] as String? ?? '';
        final bDate = b['releaseDate'] as String? ?? '';
        return bDate.compareTo(aDate);
      });

      for (final album in albums) {
        final cover = _extractImageUrl(album['images'] as List?, preferredType: 'cover');
        if (cover != null) return cover;
      }
    } catch (_) {}

    return null;
  }

  LidarrArtist _mapToLidarrArtist(Map<String, dynamic> json) {
    return LidarrArtist(
      id: json['id']?.toString(),
      artistName: json['artistName'] ?? 'Unknown Artist',
      mbid: json['foreignArtistId'],
      status: json['status'],
      monitored: json['monitored'] ?? false,
      isAdded: json['id'] != null,
      remotePoster: (json['remotePoster'] as String?) ??
          _extractImageUrl(json['images'] as List?, preferredType: 'poster'),
      disambiguation: json['disambiguation'] as String?,
    );
  }

  LidarrAlbum _mapToLidarrAlbum(Map<String, dynamic> json, {required bool isInLibrary}) {
    final stats = json['statistics'] as Map<String, dynamic>?;
    return LidarrAlbum(
      id: json['id']?.toString(),
      title: json['title'] ?? 'Unknown Album',
      artistName: json['artistName'] as String? ?? '',
      releaseDate: json['releaseDate'],
      remoteCover: _extractImageUrl(json['images'] as List?, preferredType: 'cover'),
      monitored: json['monitored'] ?? false,
      isInLibrary: isInLibrary,
      trackFileCount: _readInt(stats?['trackFileCount']),
      trackCount: _readInt(stats?['trackCount']),
    );
  }

  String? _extractImageUrl(List? images, {required String preferredType}) {
    if (images == null || images.isEmpty) return null;

    for (final image in images) {
      if (image is Map && image['coverType'] == preferredType) {
        final resolved = _resolveImageUrl(image);
        if (resolved != null) return resolved;
      }
    }

    for (final image in images) {
      if (image is Map) {
        final resolved = _resolveImageUrl(image);
        if (resolved != null) return resolved;
      }
    }

    return null;
  }

  String? _resolveImageUrl(Map<dynamic, dynamic> image) {
    final remoteUrl = image['remoteUrl'] as String?;
    if (remoteUrl != null && remoteUrl.isNotEmpty && remoteUrl.startsWith('http')) {
      return remoteUrl;
    }

    final url = image['url'] as String?;
    if (url != null && url.isNotEmpty) {
      if (url.startsWith('http')) return url;
      if (url.startsWith('/')) return '$_baseUrl:8686$url';
    }

    return remoteUrl;
  }

  int? _readInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is double) return value.round();
    if (value is String) return int.tryParse(value);
    return null;
  }

  String _parseDioError(DioException e) {
    final data = e.response?.data;
    if (data is List) {
      final messages = data
          .whereType<Map>()
          .map((item) => item['errorMessage']?.toString())
          .whereType<String>()
          .where((message) => message.isNotEmpty)
          .toList();
      if (messages.isNotEmpty) return messages.join('\n');
    }
    if (data is Map && data['message'] != null) {
      return data['message'].toString();
    }
    return 'Falha ao adicionar artista (${e.response?.statusCode ?? 'rede'}).';
  }
}
