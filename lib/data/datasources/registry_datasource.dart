import 'package:dio/dio.dart';

abstract class RegistryDataSource {
  Future<Map<String, dynamic>> getConfig(String baseUrl, String token);
}

class RegistryDataSourceImpl implements RegistryDataSource {
  final Dio dio;

  RegistryDataSourceImpl({required this.dio});

  @override
  Future<Map<String, dynamic>> getConfig(String baseUrl, String token) async {
    try {
      final response = await dio.get(
        '$baseUrl:8000/config',
        options: Options(
          headers: {
            'X-Registry-Token': token,
          },
        ),
      );
      
      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      } else {
        throw Exception('Failed to load config: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching registry config: $e');
    }
  }
}
