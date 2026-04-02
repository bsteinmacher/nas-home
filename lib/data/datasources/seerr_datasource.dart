import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/media.dart';

abstract class SeerrDataSource {
  Future<List<Media>> search(String query);
  Future<List<Media>> getTrending();
  Future<void> requestMedia(int mediaId, String mediaType);
}

class SeerrDataSourceImpl implements SeerrDataSource {
  final Dio dio;
  final SharedPreferences sharedPreferences;

  SeerrDataSourceImpl({
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

  String get _apiKey => sharedPreferences.getString('seerr_api_key') ?? '';

  @override
  Future<List<Media>> search(String query) async {
    final response = await dio.get(
      '$_baseUrl:5055/api/v1/search',
      queryParameters: {'query': query},
      options: Options(headers: {'X-Api-Key': _apiKey}),
    );

    final results = response.data['results'] as List;
    return results.map((e) => _mapToMedia(e)).toList();
  }

  @override
  Future<List<Media>> getTrending() async {
    final response = await dio.get(
      '$_baseUrl:5055/api/v1/discover/trending',
      options: Options(headers: {'X-Api-Key': _apiKey}),
    );

    final results = response.data['results'] as List;
    return results.map((e) => _mapToMedia(e)).toList();
  }

  @override
  Future<void> requestMedia(int mediaId, String mediaType) async {
    await dio.post(
      '$_baseUrl:5055/api/v1/request',
      data: {
        'mediaId': mediaId,
        'mediaType': mediaType,
      },
      options: Options(headers: {'X-Api-Key': _apiKey}),
    );
  }

  Media _mapToMedia(Map<String, dynamic> json) {
    return Media(
      id: json['id'],
      title: json['title'] ?? json['name'] ?? 'Unknown',
      overview: json['overview'],
      posterPath: json['posterPath'],
      mediaType: json['mediaType'] ?? (json['title'] != null ? 'movie' : 'tv'),
      releaseDate: json['releaseDate'] ?? json['firstAirDate'],
    );
  }
}
