import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../domain/entities/hardware_info.dart';
import '../../../domain/entities/nas_service.dart';
import '../../blocs/nas_status_bloc.dart';
import '../../widgets/braille_spinner.dart';
import 'widgets/attention_panel.dart';
import 'widgets/error_state_widget.dart';
import 'widgets/hardware_resources_card.dart';
import 'widgets/module_cards.dart';
import '../services/all_services_page.dart';
import '../settings/settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(
              Icons.chevron_right,
              color: AppColors.terminalGreen,
              size: 28,
            ),
            const SizedBox(width: AppSpacing.xs),
            Expanded(
              child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => AppColors.terminalGradient.createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                ),
                child: Text(
                  'NAS_MONITOR_v1.0',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.title.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Atualizar painel',
            onPressed: () => context.read<NasStatusBloc>().add(const RefreshRequested()),
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: AppColors.terminalGreen),
            tooltip: 'Configurações',
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
                Center(child: Text('Iniciando…', style: AppTypography.body)),
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
              loaded: (services, hardwareInfo) => _buildDashboard(context, services, hardwareInfo),
              checkingUpdate: (_, services, hardwareInfo) =>
                  _buildDashboard(context, services, hardwareInfo),
              updating: (serviceName, services, hardwareInfo) => Stack(
                children: [
                  _buildDashboard(context, services, hardwareInfo),
                  Positioned(
                    left: AppSpacing.md,
                    right: AppSpacing.md,
                    bottom: AppSpacing.md,
                    child: _UpdatingBanner(serviceName: serviceName),
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

  Widget _buildDashboard(
    BuildContext context,
    List<NasService> services,
    HardwareInfo hardwareInfo,
  ) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.md,
        AppSpacing.md,
        AppSpacing.xl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UpdateNotice(services: services),
          Text('// HARDWARE', style: AppTypography.sectionHeader),
          const SizedBox(height: AppSpacing.sm),
          HardwareResourcesCard(info: hardwareInfo),
          const SizedBox(height: AppSpacing.lg),
          AttentionPanel(services: services),
          Text('// MODULES', style: AppTypography.sectionHeader),
          const SizedBox(height: AppSpacing.sm),
          ModuleCards(services: services),
          const SizedBox(height: AppSpacing.lg),
          Text('// SERVICES', style: AppTypography.sectionHeader),
          const SizedBox(height: AppSpacing.sm),
          _AllServicesLink(count: services.length),
        ],
      ),
    );
  }
}

class _UpdatingBanner extends StatelessWidget {
  final String serviceName;

  const _UpdatingBanner({required this.serviceName});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surfaceLighter,
      elevation: 6,
      borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm + AppSpacing.xs,
        ),
        child: Row(
          children: [
            const BrailleSpinner(fontSize: 16),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                'Atualizando ${serviceName.toUpperCase()}',
                style: AppTypography.label.copyWith(color: AppColors.terminalGreen),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AllServicesLink extends StatelessWidget {
  final int count;

  const _AllServicesLink({required this.count});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AllServicesPage()),
          );
        },
        borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
        child: Container(
          constraints: const BoxConstraints(minHeight: 56),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
            border: Border.all(color: AppColors.borderSubtle),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'ALL_SERVICES ($count)',
                  style: AppTypography.label,
                ),
              ),
              const Icon(Icons.chevron_right, color: AppColors.terminalGreen),
            ],
          ),
        ),
      ),
    );
  }
}
