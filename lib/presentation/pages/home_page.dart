import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/di/injection_container.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../../domain/entities/nas_service.dart';
import '../blocs/nas_status_bloc.dart';
import '../blocs/prowlarr_bloc.dart';
import '../widgets/active_services_list.dart';
import '../widgets/braille_spinner.dart';
import '../widgets/error_state_widget.dart';
import '../widgets/hardware_resources_card.dart';
import '../widgets/service_status_list.dart';
import '../widgets/prowlarr_health_card.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<NasStatusBloc>()..add(const RefreshRequested())),
        BlocProvider(create: (_) => sl<ProwlarrBloc>()..add(const FetchIndexers())),
      ],
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.chevron_right,
              color: AppColors.terminalGreen,
              size: 28,
            ),
            const SizedBox(width: AppSpacing.xs),
            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) => AppColors.terminalGradient.createShader(
                Rect.fromLTWH(0, 0, bounds.width, bounds.height),
              ),
              child: Text(
                'NAS_MONITOR_v1.0',
                style: AppTypography.terminalTitle.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, size: 20),
            onPressed: () {
              context.read<NasStatusBloc>().add(const RefreshRequested());
              context.read<ProwlarrBloc>().add(const FetchIndexers());
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: AppColors.terminalGreen, size: 20),
            onPressed: () async {
              final statusBloc = context.read<NasStatusBloc>();
              final prowlarrBloc = context.read<ProwlarrBloc>();
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
              statusBloc.add(const RefreshRequested());
              prowlarrBloc.add(const FetchIndexers());
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<NasStatusBloc>().add(const RefreshRequested());
          context.read<ProwlarrBloc>().add(const FetchIndexers());
        },
        backgroundColor: AppColors.surface,
        child: BlocBuilder<NasStatusBloc, NasStatusState>(
          builder: (context, state) {
            return state.when(
              initial: () => _buildScrollableContent(
                const Center(child: Text('Initializing system...')),
              ),
              loading: () => _buildScrollableContent(
                const Center(child: BrailleSpinner(fontSize: 24)),
              ),
              error: (message) => _buildScrollableContent(
                ErrorStateWidget(
                  message: message,
                  onRetry: () => context.read<NasStatusBloc>().add(const RefreshRequested()),
                ),
              ),
              loaded: (services, hardwareInfo) => _buildDashboard(services, hardwareInfo),
            );
          },
        ),
      ),
    );
  }

  Widget _buildScrollableContent(Widget child) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: child,
          ),
        );
      },
    );
  }

  Widget _buildDashboard(List<dynamic> services, dynamic hardwareInfo) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProwlarrHealthCard(),
          _buildSectionHeader('// HARDWARE_RESOURCES'),
          HardwareResourcesCard(info: hardwareInfo),
          const SizedBox(height: AppSpacing.lg),
          _buildSectionHeader('// SERVICE_STATUS_ALL'),
          ServiceStatusList(services: services as List<NasService>),
          const SizedBox(height: AppSpacing.xl),
          _buildSectionHeader('// QUICK_ACCESS_MODULES'),
          ActiveServicesList(services: services),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm + AppSpacing.xs),
      child: Text(
        title,
        style: AppTypography.sectionHeader,
      ),
    );
  }
}
