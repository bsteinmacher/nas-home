import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/sonarr.dart';
import '../../core/storage/secure_storage_service.dart';

abstract class SonarrDataSource {
  Future<List<SonarrSeries>> getSeries();
  Future<List<dynamic>> getQueue();
}

class SonarrDataSourceImpl implements SonarrDataSource {
  final Dio dio;
  final SharedPreferences sharedPreferences;
  final SecureStorageService secureStorage;

  SonarrDataSourceImpl({
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
      await secureStorage.read('sonarr_api_key') ?? '';

  @override
  Future<List<SonarrSeries>> getSeries() async {
    final apiKey = await _apiKey;
    final response = await dio.get(
      '$_baseUrl:8989/api/v3/series',
      options: Options(headers: {'X-Api-Key': apiKey}),
    );

    final results = response.data as List;
    return results.map((e) {
      final images = e['images'] as List?;
      final poster = images?.firstWhere(
        (img) => img['coverType'] == 'poster',
        orElse: () => images.isNotEmpty ? images.first : null,
      ) as Map<String, dynamic>?;

      return SonarrSeries(
        id: e['id'],
        title: e['title'],
        year: e['year'],
        status: e['status'],
        monitored: e['monitored'],
        remotePoster: poster?['remoteUrl'],
        seasonCount: e['seasonCount'],
      );
    }).toList();
  }

  @override
  Future<List<dynamic>> getQueue() async {
    final apiKey = await _apiKey;
    final response = await dio.get(
      '$_baseUrl:8989/api/v3/queue',
      options: Options(headers: {'X-Api-Key': apiKey}),
    );

    return response.data['records'] as List;
  }
}
