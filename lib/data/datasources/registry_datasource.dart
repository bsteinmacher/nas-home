import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class RegistryDataSource {
  Future<Map<String, dynamic>> getConfig(String baseUrl, String token);
  Future<Map<String, dynamic>> getUpdates(String baseUrl, String token, {bool force = false});
  Future<Map<String, dynamic>> updateService(String baseUrl, String token, String serviceName);
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

  @override
  Future<Map<String, dynamic>> getUpdates(String baseUrl, String token, {bool force = false}) async {
    try {
      final response = await dio.get(
        '$baseUrl:8000/updates',
        queryParameters: {'force': force},
        options: Options(
          headers: {
            'X-Registry-Token': token,
          },
        ),
      );
      
      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      } else {
        throw Exception('Failed to load updates: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching updates: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> updateService(String baseUrl, String token, String serviceName) async {
    try {
      debugPrint('DEBUG: [HTTP] POST -> $baseUrl:8000/update/$serviceName (Timeout: 5min)');
      final response = await dio.post(
        '$baseUrl:8000/update/$serviceName',
        options: Options(
          headers: {
            'X-Registry-Token': token,
          },
          sendTimeout: const Duration(minutes: 5),
          receiveTimeout: const Duration(minutes: 5),
        ),
      );
      
      if (response.statusCode == 200) {
        debugPrint('DEBUG: [HTTP] Update Success: ${response.data}');
        return response.data as Map<String, dynamic>;
      } else {
        debugPrint('DEBUG: [HTTP] Update Failed (${response.statusCode}): ${response.data}');
        throw Exception('Failed to update service: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('DEBUG: [HTTP] Error during update request: $e');
      throw Exception('Error updating service $serviceName: $e');
    }
  }
}
