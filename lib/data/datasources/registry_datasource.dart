import 'package:dio/dio.dart';

abstract class RegistryDataSource {
  Future<Map<String, dynamic>> getConfig(String baseUrl, String token);
}

class RegistryDataSourceImpl implements RegistryDataSource {
  final Dio dio;

  RegistryDataSourceImpl({required this.dio});

  @override
  Future<Map<String, dynamic>> getConfig(String baseUrl, String token) async {
    final normalizedUrl = _normalizeUrl(baseUrl);
    try {
      final response = await dio.get(
        '$normalizedUrl/config',
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

  String _normalizeUrl(String url) {
    String normalized = url.trim();
    if (!normalized.startsWith('http')) {
      normalized = 'http://$normalized';
    }
    
    // If it's a domain/IP without a port, and doesn't look like a local domain (ending in .home or having /)
    // Actually, it's safer to just check if it already has a port.
    final uri = Uri.parse(normalized);
    if (!uri.hasPort && !normalized.contains('.home') && !_isIp(uri.host)) {
       // Optional: you could force 8000 here if you want to support raw IP without port
    }
    
    // Simplest fix: Just remove the forced :8000 from the call and let the user specify it or use proxy.
    // However, to maintain backward compatibility for users using raw IP:
    if (!uri.hasPort && _isIp(uri.host)) {
      normalized = '$normalized:8000';
    }

    if (normalized.endsWith('/')) {
      normalized = normalized.substring(0, normalized.length - 1);
    }
    return normalized;
  }

  bool _isIp(String host) {
    final ipRegex = RegExp(r'^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$');
    return ipRegex.hasMatch(host);
  }
}
