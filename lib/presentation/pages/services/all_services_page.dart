import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../domain/entities/nas_service.dart';
import '../../blocs/nas_status_bloc.dart';
import '../../service_catalog.dart';
import '../../widgets/tui_app_bar.dart';
import '../../widgets/tui_status_dot.dart';
import 'service_info_sheet.dart';

class AllServicesPage extends StatelessWidget {
  const AllServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NasStatusBloc, NasStatusState>(
      builder: (context, state) {
        final services = state.maybeWhen(
          loaded: (services, _) => services,
          updating: (_, services, _) => services,
          checkingUpdate: (_, services, _) => services,
          orElse: () => const <NasService>[],
        );
        final busy = state.maybeWhen(
          updating: (_, _, _) => true,
          checkingUpdate: (_, _, _) => true,
          orElse: () => false,
        );
        return Scaffold(
          appBar: TuiAppBar(
            title: 'ALL_SERVICES',
            titleColor: AppColors.terminalGreen,
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                tooltip: 'Verificar atualizações',
                onPressed: busy
                    ? null
                    : () => context.read<NasStatusBloc>().add(
                          const CheckUpdatesRequested(),
                        ),
              ),
            ],
          ),
          body: services.isEmpty
              ? Center(
                  child: Text(
                    'Nenhum serviço carregado.',
                    style: AppTypography.body,
                  ),
                )
              : Builder(
                  builder: (context) {
                    final sorted = [...services]..sort(_compare);
                    return ListView.separated(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      itemCount: sorted.length,
                      separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
                      itemBuilder: (context, index) {
                        return _ServiceRow(service: sorted[index]);
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}

int _compare(NasService a, NasService b) {
  int rank(NasService service) {
    if (service.isDeployed && !service.isOnline) return 0;
    if (service.updateAvailable) return 1;
    if (!service.isDeployed) return 2;
    return 3;
  }

  final byRank = rank(a).compareTo(rank(b));
  if (byRank != 0) return byRank;
  return a.name.compareTo(b.name);
}

class _ServiceRow extends StatelessWidget {
  final NasService service;

  const _ServiceRow({required this.service});

  @override
  Widget build(BuildContext context) {
    final meta = serviceMetaFor(service.name);
    final iconColor = service.isDeployed ? meta.color : AppColors.textMuted;
    final statusColor = switch ((service.isDeployed, service.isOnline, service.updateAvailable)) {
      (false, _, _) => AppColors.textMuted,
      (true, false, _) => AppColors.offline,
      (true, true, true) => AppColors.update,
      _ => AppColors.terminalGreen,
    };

    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
      child: InkWell(
        onTap: () => showServiceInfoSheet(context, service),
        borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 56),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
            child: Row(
              children: [
                Icon(meta.icon, color: iconColor, size: 24),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '// ${meta.label}',
                        style: AppTypography.label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        meta.description,
                        style: AppTypography.micro.copyWith(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                TuiStatusDot(color: statusColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
