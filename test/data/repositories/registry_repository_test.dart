import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nas_home/data/datasources/registry_datasource.dart';
import 'package:nas_home/data/repositories/registry_repository_impl.dart';
import 'package:nas_home/core/storage/secure_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockRegistryDataSource extends Mock implements RegistryDataSource {}
class MockSecureStorageService extends Mock implements SecureStorageService {}
class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late RegistryRepositoryImpl repository;
  late MockRegistryDataSource mockDataSource;
  late MockSecureStorageService mockSecureStorage;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockDataSource = MockRegistryDataSource();
    mockSecureStorage = MockSecureStorageService();
    mockSharedPreferences = MockSharedPreferences();
    repository = RegistryRepositoryImpl(
      dataSource: mockDataSource,
      sharedPreferences: mockSharedPreferences,
      secureStorage: mockSecureStorage,
    );
  });

  group('syncConfig', () {
    const tBaseUrl = 'http://192.168.1.100';
    const tToken = 'test-token';

    test('should save keys with _key suffix correctly', () async {
      // arrange
      final tConfig = {
        'radarr_key': 'radarr-api-key',
        'sonarr_key': 'sonarr-api-key',
        'prowlarr_key': 'prowlarr-api-key',
        'lidarr_key': 'lidarr-api-key',
        'seerr_key': 'seerr-api-key',
      };
      when(() => mockDataSource.getConfig(any(), any()))
          .thenAnswer((_) async => tConfig);
      when(() => mockSecureStorage.write(any(), any()))
          .thenAnswer((_) async => {});
      when(() => mockSharedPreferences.setString(any(), any()))
          .thenAnswer((_) async => true);

      // act
      await repository.syncConfig(tBaseUrl, tToken);

      // assert
      verify(() => mockSecureStorage.write('radarr_api_key', 'radarr-api-key'));
      verify(() => mockSecureStorage.write('sonarr_api_key', 'sonarr-api-key'));
      verify(() => mockSecureStorage.write('prowlarr_api_key', 'prowlarr-api-key'));
      verify(() => mockSecureStorage.write('lidarr_api_key', 'lidarr-api-key'));
      verify(() => mockSecureStorage.write('seerr_api_key', 'seerr-api-key'));
    });

    test('should still save keys without _key suffix for backward compatibility', () async {
      // arrange
      final tConfig = {
        'radarr': 'radarr-api-key',
        'sonarr': 'sonarr-api-key',
        'prowlarr': 'prowlarr-api-key',
        'lidarr': 'lidarr-api-key',
        'seerr': 'seerr-api-key',
      };
      when(() => mockDataSource.getConfig(any(), any()))
          .thenAnswer((_) async => tConfig);
      when(() => mockSecureStorage.write(any(), any()))
          .thenAnswer((_) async => {});
      when(() => mockSharedPreferences.setString(any(), any()))
          .thenAnswer((_) async => true);

      // act
      await repository.syncConfig(tBaseUrl, tToken);

      // assert
      verify(() => mockSecureStorage.write('radarr_api_key', 'radarr-api-key'));
      verify(() => mockSecureStorage.write('sonarr_api_key', 'sonarr-api-key'));
      verify(() => mockSecureStorage.write('prowlarr_api_key', 'prowlarr-api-key'));
      verify(() => mockSecureStorage.write('lidarr_api_key', 'lidarr-api-key'));
      verify(() => mockSecureStorage.write('seerr_api_key', 'seerr-api-key'));
    });
  });
}
