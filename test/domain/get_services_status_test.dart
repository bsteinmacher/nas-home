import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:nas_home/domain/usecases/get_hardware_info.dart';
import 'package:nas_home/domain/usecases/get_services_status.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/fixtures.dart';
import '../helpers/mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockNasRepository repository;

  setUpAll(registerTestFallbackValues);

  setUp(() {
    repository = MockNasRepository();
    when(() => repository.getServices()).thenAnswer((_) async => testServices);
    when(
      () => repository.getServicesWithUpdates(
        any(),
        any(),
        force: any(named: 'force'),
      ),
    ).thenAnswer((_) async => testServices);
    when(
      () => repository.checkServiceStatus(
        any(),
        any(),
        hostHeader: any(named: 'hostHeader'),
      ),
    ).thenAnswer((_) async => true);
    when(() => repository.getHardwareInfo(any())).thenAnswer(
      (_) async => testHardwareInfo,
    );
  });

  group('GetServicesStatusUseCase', () {
    test('usa o registry quando ha token configurado', () async {
      final useCase = GetServicesStatusUseCase(repository);

      await useCase.execute('192.168.1.99', registryToken: 'token');

      verify(
        () => repository.getServicesWithUpdates(
          '192.168.1.99',
          'token',
          force: false,
        ),
      ).called(1);
      verifyNever(() => repository.getServices());
    });

    test('cai no catalogo base quando nao ha token', () async {
      final useCase = GetServicesStatusUseCase(repository);

      final services = await useCase.execute('192.168.1.99');

      verify(() => repository.getServices()).called(1);
      verifyNever(
        () => repository.getServicesWithUpdates(
          any(),
          any(),
          force: any(named: 'force'),
        ),
      );
      expect(services, hasLength(testServices.length));
    });

    test('servico nao deployado ou sem porta e pulado sem probe', () async {
      final useCase = GetServicesStatusUseCase(repository);

      final result = await useCase.execute('192.168.1.99', registryToken: 'token');

      // Apenas Jellyfin e Nginx (com porta) sao probeados.
      verify(
        () => repository.checkServiceStatus(
          any(),
          any(),
          hostHeader: any(named: 'hostHeader'),
        ),
      ).called(2);
      expect(
        result.firstWhere((s) => s.name == 'Nextcloud').isOnline,
        isFalse,
      );
    });

    test('probes rodam em paralelo (offline nao bloqueia os demais)', () async {
      final started = <String>[];
      final allStarted = Completer<void>();

      when(
        () => repository.checkServiceStatus(
          any(),
          any(),
          hostHeader: any(named: 'hostHeader'),
        ),
      ).thenAnswer((invocation) async {
        final port = invocation.positionalArguments[1] as String;
        started.add(port);
        if (started.length == 2 && !allStarted.isCompleted) {
          allStarted.complete();
        }
        // Espera os dois probes comecarem: em execucao serial isso
        // estouraria o timeout do teste.
        await allStarted.future.timeout(const Duration(seconds: 2));
        return port != '81';
      });

      final useCase = GetServicesStatusUseCase(repository);
      final result = await useCase
          .execute('192.168.1.99', registryToken: 'token')
          .timeout(const Duration(seconds: 5));

      expect(started, hasLength(2));
      expect(result.firstWhere((s) => s.name == 'Jellyfin').isOnline, isTrue);
      expect(
        result.firstWhere((s) => s.name == 'Nginx Proxy Manager').isOnline,
        isFalse,
      );
    });
  });

  group('GetHardwareInfoUseCase', () {
    test('delega para o repositorio', () async {
      final useCase = GetHardwareInfoUseCase(repository);

      final info = await useCase.execute('192.168.1.99');

      verify(() => repository.getHardwareInfo('192.168.1.99')).called(1);
      expect(info, testHardwareInfo);
    });
  });
}
