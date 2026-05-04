import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/prowlarr.dart';
import '../../core/storage/secure_storage_service.dart';

abstract class ProwlarrDataSource {
  Future<List<ProwlarrIndexer>> getIndexers();
}

class ProwlarrDataSourceImpl implements ProwlarrDataSource {
  final Dio dio;
  final SharedPreferences sharedPreferences;
  final SecureStorageService secureStorage;

  ProwlarrDataSourceImpl({
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
      await secureStorage.read('prowlarr_api_key') ?? '';

  @override
  Future<List<ProwlarrIndexer>> getIndexers() async {
    final apiKey = await _apiKey;
    final response = await dio.get(
      '$_baseUrl:9696/api/v1/indexer',
      options: Options(headers: {'X-Api-Key': apiKey}),
    );

    final results = response.data as List;
    return results.map((e) => ProwlarrIndexer.fromJson(e)).toList();
  }
}
