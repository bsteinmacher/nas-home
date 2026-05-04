import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/repositories/registry_repository.dart';
import '../datasources/registry_datasource.dart';
import '../../core/storage/secure_storage_service.dart';

class RegistryRepositoryImpl implements RegistryRepository {
  final RegistryDataSource dataSource;
  final SharedPreferences sharedPreferences;
  final SecureStorageService secureStorage;

  RegistryRepositoryImpl({
    required this.dataSource,
    required this.sharedPreferences,
    required this.secureStorage,
  });

  @override
  Future<void> syncConfig(String baseUrl, String token) async {
    final normalizedUrl = _normalizeUrl(baseUrl);
    final config = await dataSource.getConfig(normalizedUrl, token);

    // Save each API key found in the registry to SecureStorage
    final seerrKey = config['seerr_key'] ?? config['seerr'] ?? config['jellyseerr'];
    if (seerrKey != null) {
      await secureStorage.write('seerr_api_key', seerrKey);
    }

    final lidarrKey = config['lidarr_key'] ?? config['lidarr'];
    if (lidarrKey != null) {
      await secureStorage.write('lidarr_api_key', lidarrKey);
    }

    final prowlarrKey = config['prowlarr_key'] ?? config['prowlarr'];
    if (prowlarrKey != null) {
      await secureStorage.write('prowlarr_api_key', prowlarrKey);
    }

    final radarrKey = config['radarr_key'] ?? config['radarr'];
    if (radarrKey != null) {
      await secureStorage.write('radarr_api_key', radarrKey);
    }

    final sonarrKey = config['sonarr_key'] ?? config['sonarr'];
    if (sonarrKey != null) {
      await secureStorage.write('sonarr_api_key', sonarrKey);
    }

    // Also save the Registry Token for future syncs
    await secureStorage.write('registry_token', token);

    // Save non-sensitive NAS URL to SharedPreferences
    await sharedPreferences.setString('nas_url', normalizedUrl);
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
