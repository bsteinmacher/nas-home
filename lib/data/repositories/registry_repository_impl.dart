import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/repositories/registry_repository.dart';
import '../datasources/registry_datasource.dart';

class RegistryRepositoryImpl implements RegistryRepository {
  final RegistryDataSource dataSource;
  final SharedPreferences sharedPreferences;

  RegistryRepositoryImpl({
    required this.dataSource,
    required this.sharedPreferences,
  });

  @override
  Future<void> syncConfig(String baseUrl, String token) async {
    final normalizedUrl = _normalizeUrl(baseUrl);
    final config = await dataSource.getConfig(normalizedUrl, token);
    
    // Save each API key found in the registry to SharedPreferences
    if (config.containsKey('seerr') || config.containsKey('jellyseerr')) {
      final seerrKey = config['seerr'] ?? config['jellyseerr'];
      await sharedPreferences.setString('seerr_api_key', seerrKey);
    }
    if (config.containsKey('lidarr')) {
      await sharedPreferences.setString('lidarr_api_key', config['lidarr']);
    }
    if (config.containsKey('prowlarr')) {
      await sharedPreferences.setString('prowlarr_api_key', config['prowlarr']);
    }
    if (config.containsKey('radarr')) {
      await sharedPreferences.setString('radarr_api_key', config['radarr']);
    }
    if (config.containsKey('sonarr')) {
      await sharedPreferences.setString('sonarr_api_key', config['sonarr']);
    }
    
    // Also save the Registry Token for future syncs if needed
    await sharedPreferences.setString('registry_token', token);
  }

  String _normalizeUrl(String url) {
    String normalized = url.trim();
    if (!normalized.startsWith('http')) {
      normalized = 'http://$normalized';
    }
    if (normalized.endsWith('/')) {
      normalized = normalized.substring(0, normalized.length - 1);
    }
    // Extract only the base part without the port if it has one
    final uri = Uri.parse(normalized);
    return '${uri.scheme}://${uri.host}';
  }
}
