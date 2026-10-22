import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nas_home/domain/usecases/get_hardware_info.dart';
import 'package:nas_home/domain/usecases/get_services_status.dart';
import 'package:nas_home/presentation/blocs/nas_status_bloc.dart';
import 'package:nas_home/presentation/pages/home/widgets/service_status_list.dart';
import 'package:nas_home/presentation/widgets/service_actions.dart';

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

  NasStatusBloc buildBloc({bool withUpdate = true}) {
    final services = withUpdate
        ? [serviceWithUpdate(), testServices[1]]
        : [serviceWithUpdate().copyWith(updateAvailable: false), testServices[1]];
    when(
      () => repository.getServicesWithUpdates(
        any(),
        any(),
        force: any(named: 'force'),
      ),
    ).thenAnswer((_) async => services);
    return NasStatusBloc(
      getServicesStatus: GetServicesStatusUseCase(repository),
      getHardwareInfo: GetHardwareInfoUseCase(repository),
      sharedPreferences: prefs,
      nasRepository: repository,
    );
  }

  Future<NasStatusBloc> pumpAction(
    WidgetTester tester, {
    bool withUpdate = true,
  }) async {
    final bloc = buildBloc(withUpdate: withUpdate);
    bloc.add(const RefreshRequested());
    await tester.pumpWidget(
      BlocProvider.value(
        value: bloc,
        child: const MaterialApp(
          home: Scaffold(
            body: ServiceUpdateAction(serviceName: 'Jellyfin', color: Colors.green),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    return bloc;
  }

  group('ServiceUpdateAction (indicacoes visuais)', () {
    testWidgets('mostra icone de update quando ha atualizacao disponivel',
        (tester) async {
      await pumpAction(tester, withUpdate: true);

      expect(find.byIcon(Icons.system_update_alt), findsOneWidget);
      expect(find.byIcon(Icons.info_outline), findsNothing);
    });

    testWidgets('mostra icone de info quando o servico esta em dia',
        (tester) async {
      await pumpAction(tester, withUpdate: false);

      expect(find.byIcon(Icons.info_outline), findsOneWidget);
      expect(find.byIcon(Icons.system_update_alt), findsNothing);
    });
  });

  group('ServiceUpdateAction (dialogo de update)', () {
    testWidgets('dialogo de novo release mostra versoes e botao de update',
        (tester) async {
      await pumpAction(tester, withUpdate: true);

      await tester.tap(find.byIcon(Icons.system_update_alt));
      await tester.pumpAndSettle();

      expect(find.text('NEW_VERSION_FOUND'), findsOneWidget);
      expect(find.textContaining('ACTUAL_VERSION: v1.0.0'), findsOneWidget);
      // Imagem ghcr sem data de release: mostra tag + digest remoto curto.
      expect(
        find.textContaining("NEW_RELEASE:    TAG: latest @sha256:new"),
        findsOneWidget,
      );
      expect(find.text('PROCEED_UPDATE'), findsOneWidget);
    });

    testWidgets('dialogo de servico em dia nao oferece botao de update',
        (tester) async {
      await pumpAction(tester, withUpdate: false);

      await tester.tap(find.byIcon(Icons.info_outline));
      await tester.pumpAndSettle();

      expect(find.text('SERVICE_UP_TO_DATE'), findsOneWidget);
      expect(find.text('PROCEED_UPDATE'), findsNothing);
    });

    testWidgets('versao local sem label cai no fallback do digest curto',
        (tester) async {
      final bloc = buildBloc(withUpdate: true);
      final services = [
        serviceWithUpdate(localVersion: null).copyWith(
          localDigest: 'sha256:abcdef123456789',
        ),
        testServices[1],
      ];
      when(
        () => repository.getServicesWithUpdates(
          any(),
          any(),
          force: any(named: 'force'),
        ),
      ).thenAnswer((_) async => services);
      bloc.add(const RefreshRequested());
      await tester.pumpWidget(
        BlocProvider.value(
          value: bloc,
          child: const MaterialApp(
            home: Scaffold(
              body: ServiceUpdateAction(serviceName: 'Jellyfin', color: Colors.green),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.system_update_alt));
      await tester.pumpAndSettle();

      expect(find.textContaining('ACTUAL_VERSION:'), findsOneWidget);
      expect(find.textContaining('sha256:abcde'), findsOneWidget);
    });

    testWidgets(
        'PROCEED_UPDATE dispara o update e mostra snackbar de tarefa em background',
        (tester) async {
      final bloc = await pumpAction(tester, withUpdate: true);

      await tester.tap(find.byIcon(Icons.system_update_alt));
      await tester.pumpAndSettle();
      await tester.tap(find.text('PROCEED_UPDATE'));
      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(
        find.textContaining('UPDATE_TASK_QUEUED: Jellyfin'),
        findsOneWidget,
      );

      // Aguarda o fluxo do bloc (delay de 5s + refresh) completar.
      await tester.pumpAndSettle(const Duration(seconds: 6));

      verify(
        () => repository.updateService(any(), any(), 'Jellyfin'),
      ).called(1);
      final state = bloc.state as Loaded;
      expect(
        state.services.firstWhere((s) => s.name == 'Jellyfin').localVersion,
        'v2.0.0',
      );
    });

    testWidgets('ServiceRefreshAction dispara check de update do servico',
        (tester) async {
      final bloc = buildBloc(withUpdate: true);
      bloc.add(const RefreshRequested());
      await tester.pumpWidget(
        BlocProvider.value(
          value: bloc,
          child: const MaterialApp(
            home: Scaffold(
              body: ServiceRefreshAction(serviceName: 'Jellyfin'),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.refresh));
      await tester.pumpAndSettle();

      verify(
        () => repository.refreshServiceUpdateInfo(
          any(),
          any(),
          any(),
        ),
      ).called(1);
    });
  });

  group('ServiceStatusList (badges)', () {
    testWidgets('mostra indicador de update apenas nos servicos atualizaveis',
        (tester) async {
      final services = [
        serviceWithUpdate().copyWith(isOnline: true),
        testServices[1].copyWith(isOnline: true),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ServiceStatusList(services: services),
          ),
        ),
      );

      // Nginx (sem update): apenas o item sem icone de info extra.
      expect(find.byIcon(Icons.info_outline), findsOneWidget);
      expect(find.text(' JELLYFIN'), findsOneWidget);
      expect(find.text(' NGINX_PROXY_MANAGER'), findsOneWidget);
    });
  });
}
