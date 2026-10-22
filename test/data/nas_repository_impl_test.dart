import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nas_home/data/repositories/nas_repository_impl.dart';
import 'package:nas_home/domain/entities/nas_service.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockRegistryDataSource registry;
  late NasRepositoryImpl repository;

  setUpAll(registerTestFallbackValues);

  setUp(() {
    registry = MockRegistryDataSource();
    repository = NasRepositoryImpl(Dio(), registry);
  });

  group('getServicesWithUpdates (mapeamento do registry)', () {
    test('casa container normalizado e preenche info de update', () async {
      when(
        () => registry.getUpdates(
          any(),
          any(),
          force: any(named: 'force'),
          container: any(named: 'container'),
        ),
      ).thenAnswer((_) async => {
            'nginx-proxy-manager': {
              'update_available': true,
              'local_digest': 'sha256:local',
              'remote_digest': 'sha256:remote',
              'local_version': 'v1.0.0',
              'remote_last_updated': '2026-01-01T00:00:00Z',
              'image_tag': 'latest',
            },
          });

      final services = await repository.getServicesWithUpdates(
        'http://192.168.1.99',
        'token',
      );

      final nginx = services.firstWhere((s) => s.name == 'Nginx Proxy Manager');
      expect(nginx.updateAvailable, isTrue);
      expect(nginx.containerName, 'nginx-proxy-manager');
      expect(nginx.localDigest, 'sha256:local');
      expect(nginx.remoteDigest, 'sha256:remote');
      expect(nginx.localVersion, 'v1.0.0');
      expect(nginx.remoteLastUpdated, '2026-01-01T00:00:00Z');
      expect(nginx.imageTag, 'latest');

      // Servicos sem info no registry permanecem inalterados.
      final jellyfin = services.firstWhere((s) => s.name == 'Jellyfin');
      expect(jellyfin.updateAvailable, isFalse);
      expect(jellyfin.containerName, isNull);
    });

    test('update_info vazio nao marca o servico como atualizavel', () async {
      when(
        () => registry.getUpdates(
          any(),
          any(),
          force: any(named: 'force'),
          container: any(named: 'container'),
        ),
      ).thenAnswer((_) async => {'jellyfin': <String, dynamic>{}});

      final services = await repository.getServicesWithUpdates(
        'http://192.168.1.99',
        'token',
      );

      expect(
        services.firstWhere((s) => s.name == 'Jellyfin').updateAvailable,
        isFalse,
      );
    });

    test('falha do registry cai no catalogo base sem lancar excecao', () async {
      when(
        () => registry.getUpdates(
          any(),
          any(),
          force: any(named: 'force'),
          container: any(named: 'container'),
        ),
      ).thenThrow(Exception('registry offline'));

      final services = await repository.getServicesWithUpdates(
        'http://192.168.1.99',
        'token',
      );

      expect(services, hasLength(21));
      expect(services.every((s) => !s.updateAvailable), isTrue);
    });

    test('refreshServiceUpdateInfo retorna o servico atualizado', () async {
      const service = NasService(
        name: 'Jellyfin',
        port: '8096',
        description: 'Media Server',
        containerName: 'jellyfin',
        updateAvailable: true,
      );
      when(
        () => registry.getUpdates(
          any(),
          any(),
          force: any(named: 'force'),
          container: 'jellyfin',
        ),
      ).thenAnswer((_) async => {
            'jellyfin': {
              'update_available': false,
              'local_digest': 'sha256:new',
              'remote_digest': 'sha256:new',
              'local_version': 'v2.0.0',
              'image_tag': 'latest',
            },
          });

      final updated = await repository.refreshServiceUpdateInfo(
        'http://192.168.1.99',
        'token',
        service,
      );

      expect(updated.updateAvailable, isFalse);
      expect(updated.localVersion, 'v2.0.0');
      expect(updated.localDigest, 'sha256:new');
    });
  });
}
