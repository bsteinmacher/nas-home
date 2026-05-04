import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/radarr.dart';
import '../../core/storage/secure_storage_service.dart';

abstract class RadarrDataSource {
  Future<List<RadarrMovie>> getMovies();
  Future<List<dynamic>> getQueue();
}

class RadarrDataSourceImpl implements RadarrDataSource {
  final Dio dio;
  final SharedPreferences sharedPreferences;
  final SecureStorageService secureStorage;

  RadarrDataSourceImpl({
    required this.dio,
    required this.sharedPreferences,
    required this.secureStorage,
  });

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

  Future<String> get _apiKey async =>
      await secureStorage.read('radarr_api_key') ?? '';

  @override
  Future<List<RadarrMovie>> getMovies() async {
    final apiKey = await _apiKey;
    final response = await dio.get(
      '$_baseUrl:7878/api/v3/movie',
      options: Options(headers: {'X-Api-Key': apiKey}),
    );

    final results = response.data as List;
    return results.map((e) {
      final images = e['images'] as List?;
      final poster = images?.firstWhere(
        (img) => img['coverType'] == 'poster',
        orElse: () => images.isNotEmpty ? images.first : null,
      ) as Map<String, dynamic>?;

      return RadarrMovie(
        id: e['id'],
        title: e['title'],
        year: e['year'],
        status: e['status'],
        monitored: e['monitored'],
        remotePoster: poster?['remoteUrl'],
        sizeOnDisk: e['sizeOnDisk'],
      );
    }).toList();
  }

  @override
  Future<List<dynamic>> getQueue() async {
    final apiKey = await _apiKey;
    final response = await dio.get(
      '$_baseUrl:7878/api/v3/queue',
      options: Options(headers: {'X-Api-Key': apiKey}),
    );

    return response.data['records'] as List;
  }
}
