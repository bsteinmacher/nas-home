import 'package:dio/dio.dart';
import '../../domain/entities/media.dart';

abstract class JellyseerrDataSource {
  Future<List<Media>> search(String query);
  Future<List<Media>> getTrending();
  Future<void> requestMedia(int mediaId, String mediaType);
}

class JellyseerrDataSourceImpl implements JellyseerrDataSource {
  final Dio dio;
  final String baseUrl;
  final String apiKey;

  JellyseerrDataSourceImpl({
    required this.dio,
    required this.baseUrl,
    required this.apiKey,
  });

  @override
  Future<List<Media>> search(String query) async {
    final response = await dio.get(
      '$baseUrl:5055/api/v1/search',
      queryParameters: {'query': query},
      options: Options(headers: {'X-Api-Key': apiKey}),
    );

    final results = response.data['results'] as List;
    return results.map((e) => _mapToMedia(e)).toList();
  }

  @override
  Future<List<Media>> getTrending() async {
    final response = await dio.get(
      '$baseUrl:5055/api/v1/discover/trending',
      options: Options(headers: {'X-Api-Key': apiKey}),
    );

    final results = response.data['results'] as List;
    return results.map((e) => _mapToMedia(e)).toList();
  }

  @override
  Future<void> requestMedia(int mediaId, String mediaType) async {
    await dio.post(
      '$baseUrl:5055/api/v1/request',
      data: {
        'mediaId': mediaId,
        'mediaType': mediaType,
      },
      options: Options(headers: {'X-Api-Key': apiKey}),
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
