import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nas_home/domain/usecases/get_hardware_info.dart';
import 'package:nas_home/domain/usecases/get_services_status.dart';
import 'package:nas_home/presentation/blocs/nas_status_bloc.dart';
import 'package:nas_home/domain/entities/nas_service.dart';
import 'package:nas_home/presentation/pages/home/widgets/attention_panel.dart';
import 'package:nas_home/presentation/pages/home/widgets/module_cards.dart';
import 'package:nas_home/presentation/widgets/service_actions.dart';
import 'package:nas_home/presentation/widgets/tui_toast.dart';

import '../helpers/fixtures.dart';
import '../helpers/mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockNasRepository repository;
  late MockSharedPreferences prefs;

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
    registerTestFallbackValues();
  });

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

    testWidgets('nao mostra icone quando o servico esta em dia',
        (tester) async {
      await pumpAction(tester, withUpdate: false);

      expect(find.byIcon(Icons.info_outline), findsNothing);
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
      expect(find.text('UPDATE_NOW'), findsOneWidget);
    });

    testWidgets('dialogo de servico em dia nao oferece botao de update',
        (tester) async {
      final bloc = buildBloc(withUpdate: false);
      bloc.add(const RefreshRequested());
      await tester.pumpWidget(
        BlocProvider.value(
          value: bloc,
          child: MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) => TextButton(
                  onPressed: () {
                    final loaded = context.read<NasStatusBloc>().state as Loaded;
                    showServiceUpdateDialog(
                      context,
                      loaded.services.first,
                      Colors.green,
                    );
                  },
                  child: const Text('OPEN'),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('OPEN'));
      await tester.pumpAndSettle();

      expect(find.text('SERVICE_UP_TO_DATE'), findsOneWidget);
      expect(find.text('UPDATE_NOW'), findsNothing);
      expect(find.text('CANCEL'), findsOneWidget);
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
        'UPDATE_NOW dispara o update e mostra aviso de tarefa em background',
        (tester) async {
      final bloc = await pumpAction(tester, withUpdate: true);

      await tester.tap(find.byIcon(Icons.system_update_alt));
      await tester.pumpAndSettle();
      await tester.tap(find.text('UPDATE_NOW'));
      await tester.pump();

      expect(
        find.textContaining('Atualização de Jellyfin iniciada'),
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

  group('AttentionPanel', () {
    testWidgets('lista so offline e omite update e quem esta saudavel',
        (tester) async {
      final services = [
        serviceWithUpdate().copyWith(isOnline: true),
        testServices[1].copyWith(isOnline: false, isDeployed: true),
        testServices[2].copyWith(isOnline: true, updateAvailable: false),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                UpdateNotice(services: services),
                AttentionPanel(services: services),
              ],
            ),
          ),
        ),
      );

      expect(find.text('1 atualização disponível'), findsOneWidget);
      expect(find.text('UPDATE'), findsNothing);
      expect(find.text('[OFFLINE]'), findsOneWidget);
      expect(find.text('JELLYFIN'), findsNothing);
      expect(find.text('NGINX_PROXY_MANAGER'), findsOneWidget);
      expect(find.textContaining('NEXTCLOUD'), findsNothing);
    });

    testWidgets('sem pendencias nao ocupa a tela', (tester) async {
      final services = [
        serviceWithUpdate().copyWith(isOnline: true, updateAvailable: false),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AttentionPanel(services: services),
          ),
        ),
      );

      expect(find.textContaining('NO_UPDATES'), findsNothing);
      expect(find.text('CHECK_ALL'), findsNothing);
      expect(find.text('UPDATE'), findsNothing);
    });

    testWidgets('cabe em 360px com texto 1.3 sem overflow', (tester) async {
      tester.view.physicalSize = const Size(360, 800);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final services = [
        serviceWithUpdate(name: 'Seerr').copyWith(isOnline: true, port: '5055'),
        const NasService(name: 'Lidarr', port: '8686', description: 'Music', isOnline: true),
        const NasService(name: 'Syncthing', port: '8384', description: 'Music DL', isOnline: false),
        serviceWithUpdate().copyWith(isOnline: true),
      ];

      await tester.pumpWidget(
        BlocProvider(
          create: (_) => buildBloc(),
          child: MaterialApp(
            builder: (context, child) => MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(1.3),
              ),
              child: child!,
            ),
            home: Scaffold(
              body: ListView(
                children: [
                  AttentionPanel(services: services),
                  ModuleCards(services: services),
                ],
              ),
            ),
          ),
        ),
      );

      expect(tester.takeException(), isNull);
      expect(find.text('SEERR'), findsOneWidget);
      expect(find.text('LIDARR'), findsOneWidget);
      expect(find.text('MUSIC_DL'), findsWidgets);
    });
  });

  group('TuiToast', () {
    testWidgets('erro fica na tela com prefixo e dismiss', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => TextButton(
                onPressed: () => TuiToast.show(
                  context,
                  'Falha ao sincronizar.',
                  kind: TuiToastKind.error,
                ),
                child: const Text('TOAST'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('TOAST'));
      await tester.pump();

      expect(find.textContaining('[ERR]'), findsOneWidget);
      expect(find.textContaining('Falha ao sincronizar.'), findsOneWidget);
      expect(find.text('DISMISS'), findsOneWidget);
    });
  });
}
