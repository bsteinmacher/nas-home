import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/music.dart';

abstract class MusicDataSource {
  Future<List<Artist>> searchArtists(String query);
  Future<void> requestArtist(Artist artist);
  Future<List<Album>> getAlbums(String artistId);
}

class LidarrDataSourceImpl implements MusicDataSource {
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
  Future<List<Artist>> searchArtists(String query) async {
    final response = await dio.get(
      '$_baseUrl:8686/api/v1/artist/lookup',
      queryParameters: {'term': query},
      options: Options(headers: {'X-Api-Key': _apiKey}),
    );

    final results = response.data as List;
    return results.map((e) => _mapToArtist(e)).toList();
  }

  @override
  Future<void> requestArtist(Artist artist) async {
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
  Future<List<Album>> getAlbums(String artistId) async {
    final response = await dio.get(
      '$_baseUrl:8686/api/v1/album',
      queryParameters: {'artistId': artistId},
      options: Options(headers: {'X-Api-Key': _apiKey}),
    );

    final results = response.data as List;
    return results.map((e) => _mapToAlbum(e)).toList();
  }

  Artist _mapToArtist(Map<String, dynamic> json) {
    final images = json['images'] as List?;
    final poster = images?.firstWhere(
      (img) => img['coverType'] == 'poster',
      orElse: () => images.isNotEmpty ? images.first : null,
    );

    return Artist(
      id: json['id']?.toString(),
      artistName: json['artistName'] ?? 'Unknown Artist',
      mbid: json['foreignArtistId'],
      status: json['status'],
      monitored: json['monitored'] ?? false,
      isAdded: json['id'] != null,
      remotePoster: poster?['remoteUrl'],
    );
  }

  Album _mapToAlbum(Map<String, dynamic> json) {
    final images = json['images'] as List?;
    final cover = images?.firstWhere(
      (img) => img['coverType'] == 'cover',
      orElse: () => images.isNotEmpty ? images.first : null,
    );

    return Album(
      id: json['id']?.toString(),
      title: json['title'] ?? 'Unknown Album',
      artistName: '', // Lidarr doesn't always include this in album list
      releaseDate: json['releaseDate'],
      remoteCover: cover?['remoteUrl'],
      monitored: json['monitored'] ?? false,
    );
  }
}
