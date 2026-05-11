import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../domain/entities/nas_service.dart';
import '../../blocs/nas_status_bloc.dart';
import 'widgets/active_services_list.dart';
import '../../widgets/braille_spinner.dart';
import 'widgets/error_state_widget.dart';
import 'widgets/hardware_resources_card.dart';
import 'widgets/service_status_list.dart';
import '../settings/settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
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
            onPressed: () => context.read<NasStatusBloc>().add(const CheckUpdatesRequested()),
            tooltip: 'Force Refresh & Updates',
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: AppColors.terminalGreen, size: 20),
            onPressed: () async {
              final bloc = context.read<NasStatusBloc>();
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
              bloc.add(const RefreshRequested());
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final bloc = context.read<NasStatusBloc>();
          bloc.add(const RefreshRequested());
          await bloc.stream.firstWhere((state) => state is! Loading);
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
              updating: (serviceName, services, hardwareInfo) => Stack(
                children: [
                  _buildDashboard(services, hardwareInfo),
                  // Overlay de loading discreto estilo terminal
                  Positioned(
                    bottom: AppSpacing.md,
                    right: AppSpacing.md,
                    child: Container(
                      padding: const EdgeInsets.all(AppSpacing.sm),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.8),
                        border: Border.all(color: AppColors.terminalGreen.withValues(alpha: 0.5)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const BrailleSpinner(fontSize: 12),
                          const SizedBox(width: AppSpacing.sm),
                          Text(
                            'UPDATING_${serviceName.toUpperCase()}...', 
                            style: AppTypography.moduleLabel.copyWith(fontSize: 10, color: AppColors.terminalGreen),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
