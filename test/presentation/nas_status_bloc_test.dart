import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nas_home/domain/usecases/get_hardware_info.dart';
import 'package:nas_home/domain/usecases/get_services_status.dart';
import 'package:nas_home/presentation/blocs/nas_status_bloc.dart';

import '../helpers/fixtures.dart';
import '../helpers/mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockNasRepository repository;
  late MockSharedPreferences prefs;

  setUpAll(registerTestFallbackValues);

  setUp(() {
    repository = MockNasRepository();
    prefs = MockSharedPreferences();
    reset(prefs);
    when(() => prefs.getString('nas_url')).thenReturn('192.168.1.99');
    when(() => prefs.getString('registry_token')).thenReturn('token');

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
    when(
      () => repository.refreshServiceUpdateInfo(
        any(),
        any(),
        any(),
      ),
    ).thenAnswer(
      (_) async => serviceWithUpdate(localVersion: 'v2.0.0').copyWith(
        updateAvailable: false,
      ),
    );
    when(
      () => repository.updateService(any(), any(), any()),
    ).thenAnswer((_) async {});
  });

  NasStatusBloc buildBloc() {
    return NasStatusBloc(
      getServicesStatus: GetServicesStatusUseCase(repository),
      getHardwareInfo: GetHardwareInfoUseCase(repository),
      sharedPreferences: prefs,
      nasRepository: repository,
    );
  }

  group('validacoes de configuracao', () {
    blocTest<NasStatusBloc, NasStatusState>(
      'refresh sem URL do NAS emite erro de configuracao',
      setUp: () {
        when(() => prefs.getString('nas_url')).thenReturn(null);
        when(() => prefs.getString('registry_token')).thenReturn(null);
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const RefreshRequested()),
      expect: () => [isA<Loading>(), isA<Error>()],
      verify: (bloc) {
        expect((bloc.state as Error).message, contains('URL do NAS'));
      },
    );

    blocTest<NasStatusBloc, NasStatusState>(
      'refresh com token vazio emite erro de configuracao',
      setUp: () {
        when(() => prefs.getString('registry_token')).thenReturn(null);
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const RefreshRequested()),
      expect: () => [isA<Loading>(), isA<Error>()],
      verify: (bloc) {
        expect((bloc.state as Error).message, contains('token'));
      },
    );

    blocTest<NasStatusBloc, NasStatusState>(
      'update sem token configurado emite erro em vez de falhar silenciosamente',
      setUp: () {
        when(() => prefs.getString('registry_token')).thenReturn(null);
      },
      seed: () => Loaded([serviceWithUpdate()], testHardwareInfo),
      build: buildBloc,
      act: (bloc) => bloc.add(const UpdateServiceRequested('Jellyfin')),
      expect: () => [isA<Error>()],
      verify: (bloc) {
        expect((bloc.state as Error).message, contains("token"));
        verifyNever(
          () => repository.updateService(any(), any(), any()),
        );
      },
    );
  });

  group('refresh (carregamento do dashboard)', () {
    blocTest<NasStatusBloc, NasStatusState>(
      'refresh com sucesso emite Loading e depois Loaded com servicos e hardware',
      build: buildBloc,
      act: (bloc) => bloc.add(const RefreshRequested()),
      expect: () => [isA<Loading>(), isA<Loaded>()],
      verify: (bloc) {
        final loaded = bloc.state as Loaded;
        expect(loaded.services, hasLength(testServices.length));
        expect(loaded.hardwareInfo, testHardwareInfo);
      },
    );

    blocTest<NasStatusBloc, NasStatusState>(
      'refresh manual com dados carregados NAO mostra loading em tela cheia',
      seed: () => Loaded(testServices, testHardwareInfo),
      build: buildBloc,
      act: (bloc) => bloc.add(const RefreshRequested()),
      expect: () => [isA<Loaded>()],
    );
  });

  group('update de servico', () {
    blocTest<NasStatusBloc, NasStatusState>(
      'update com sucesso emite updating e recarrega o servico atualizado',
      seed: () => Loaded([serviceWithUpdate()], testHardwareInfo),
      build: buildBloc,
      act: (bloc) => bloc.add(const UpdateServiceRequested('Jellyfin')),
      wait: const Duration(seconds: 6),
      expect: () => [
        isA<Updating>(),
        isA<Loaded>(),
      ],
      verify: (bloc) {
        verify(
          () => repository.updateService(any(), any(), 'Jellyfin'),
        ).called(1);
        verify(
          () => repository.refreshServiceUpdateInfo(
            any(),
            any(),
            any(),
          ),
        ).called(1);
        final loaded = bloc.state as Loaded;
        final jellyfin = loaded.services.firstWhere((s) => s.name == 'Jellyfin');
        expect(jellyfin.localVersion, 'v2.0.0');
        expect(jellyfin.updateAvailable, isFalse);
      },
    );

    blocTest<NasStatusBloc, NasStatusState>(
      'update com falha preserva o dashboard e emite erro visivel por ultimo',
      seed: () => Loaded([serviceWithUpdate()], testHardwareInfo),
      build: buildBloc,
      setUp: () {
        when(
          () => repository.updateService(any(), any(), any()),
        ).thenThrow(Exception('registry down'));
      },
      act: (bloc) => bloc.add(const UpdateServiceRequested('Jellyfin')),
      expect: () => [
        isA<Updating>(),
        isA<Loaded>(),
        isA<Error>(),
      ],
      verify: (bloc) {
        expect((bloc.state as Error).message, contains('Update failed'));
      },
    );

    blocTest<NasStatusBloc, NasStatusState>(
      'update sem estado Loaded e ignorado',
      build: buildBloc,
      act: (bloc) => bloc.add(const UpdateServiceRequested('Jellyfin')),
      expect: () => [],
      verify: (bloc) {
        verifyNever(
          () => repository.updateService(any(), any(), any()),
        );
      },
    );
  });

  group('check de update de um servico', () {
    blocTest<NasStatusBloc, NasStatusState>(
      'check emite CheckingUpdate e Loaded com servico atualizado',
      seed: () => Loaded([serviceWithUpdate()], testHardwareInfo),
      build: buildBloc,
      act: (bloc) => bloc.add(const CheckServiceUpdateRequested('Jellyfin')),
      expect: () => [
        isA<CheckingUpdate>(),
        isA<Loaded>(),
      ],
      verify: (bloc) {
        verify(
          () => repository.refreshServiceUpdateInfo(
            any(),
            any(),
            any(),
          ),
        ).called(1);
      },
    );

    blocTest<NasStatusBloc, NasStatusState>(
      'check sem token configurado e ignorado',
      seed: () => Loaded([serviceWithUpdate()], testHardwareInfo),
      setUp: () {
        when(() => prefs.getString('registry_token')).thenReturn(null);
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const CheckServiceUpdateRequested('Jellyfin')),
      expect: () => [],
      verify: (bloc) {
        verifyNever(
          () => repository.refreshServiceUpdateInfo(
            any(),
            any(),
            any(),
          ),
        );
      },
    );
  });
}
