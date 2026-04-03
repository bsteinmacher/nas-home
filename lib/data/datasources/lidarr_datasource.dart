import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/lidarr.dart';

abstract class LidarrDataSource {
  Future<List<LidarrArtist>> searchArtists(String query);
  Future<void> requestArtist(LidarrArtist artist);
  Future<List<LidarrAlbum>> getAlbums(String artistId);
}

class LidarrDataSourceImpl implements LidarrDataSource {
  final Dio dio;
  final SharedPreferences sharedPreferences;

  LidarrDataSourceImpl({
    required this.dio,
    required this.sharedPreferences,
  });

  String get _baseUrl {
    String url = sharedPreferences.getString('nas_url') ?? '';
    if (!url.startsWith('http')) {
      url = 'http://$url';
    }
    if (url.endsWith('/')) {
      url = url.substring(0, url.length - 1);
    }
    // Extract only the base part without the port if it has one
    final uri = Uri.parse(url);
    return '${uri.scheme}://${uri.host}';
  }

  String get _apiKey => sharedPreferences.getString('lidarr_api_key') ?? '';

  @override
  Future<List<LidarrArtist>> searchArtists(String query) async {
    final trimmedQuery = query.trim();
    if (trimmedQuery.isEmpty) return [];

    final response = await dio.get(
      '$_baseUrl:8686/api/v1/artist/lookup',
      queryParameters: {'term': trimmedQuery},
      options: Options(headers: {'X-Api-Key': _apiKey}),
    );

    final results = response.data as List;
    return results.map((e) => _mapToLidarrArtist(e)).toList();
  }

  @override
  Future<void> requestArtist(LidarrArtist artist) async {
    await dio.post(
      '$_baseUrl:8686/api/v1/artist',
      data: {
        'artistName': artist.artistName,
        'foreignArtistId': artist.mbid,
        'rootFolderPath': '/music',
        'qualityProfileId': 1,
        'monitored': true,
        'addOptions': {'searchForMissingAlbums': true},
      },
      options: Options(headers: {'X-Api-Key': _apiKey}),
    );
  }

  @override
  Future<List<LidarrAlbum>> getAlbums(String artistId) async {
    final response = await dio.get(
      '$_baseUrl:8686/api/v1/album',
      queryParameters: {'artistId': artistId},
      options: Options(headers: {'X-Api-Key': _apiKey}),
    );

    final results = response.data as List;
    return results.map((e) => _mapToLidarrAlbum(e)).toList();
  }

  LidarrArtist _mapToLidarrArtist(Map<String, dynamic> json) {
    final images = json['images'] as List?;
    final poster = images?.firstWhere(
      (img) => img['coverType'] == 'poster',
      orElse: () => images.isNotEmpty ? images.first : null,
    );

    return LidarrArtist(
      id: json['id']?.toString(),
      artistName: json['artistName'] ?? 'Unknown Artist',
      mbid: json['foreignArtistId'],
      status: json['status'],
      monitored: json['monitored'] ?? false,
      isAdded: json['id'] != null,
      remotePoster: poster?['remoteUrl'],
    );
  }

  LidarrAlbum _mapToLidarrAlbum(Map<String, dynamic> json) {
    final images = json['images'] as List?;
    final cover = images?.firstWhere(
      (img) => img['coverType'] == 'cover',
      orElse: () => images.isNotEmpty ? images.first : null,
    );

    return LidarrAlbum(
      id: json['id']?.toString(),
      title: json['title'] ?? 'Unknown Album',
      artistName: '', // Lidarr doesn't always include this in album list
      releaseDate: json['releaseDate'],
      remoteCover: cover?['remoteUrl'],
      monitored: json['monitored'] ?? false,
    );
  }
}
