import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../domain/entities/nas_service.dart';
import '../../../service_catalog.dart';
import '../../../widgets/tui_status_dot.dart';

class ModuleCards extends StatelessWidget {
  final List<NasService> services;

  const ModuleCards({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    final byName = {for (final service in services) service.name: service};
    final cards = <Widget>[];
    for (final name in moduleOrder) {
      final service = byName[name];
      final meta = serviceCatalog[name];
      if (service == null || meta == null || meta.page == null) continue;
      cards.add(_ModuleCard(service: service, meta: meta));
    }

    return Column(children: cards);
  }
}

class _ModuleCard extends StatelessWidget {
  final NasService service;
  final ServiceMeta meta;

  const _ModuleCard({required this.service, required this.meta});

  @override
  Widget build(BuildContext context) {
    final online = service.isOnline;
    final statusColor = online ? AppColors.terminalGreen : AppColors.offline;
    final statusLabel = online ? 'ONLINE' : 'OFFLINE';

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm + AppSpacing.xs),
      child: Material(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
        child: InkWell(
          onTap: () {
            final page = meta.page;
            if (page == null) return;
            Navigator.push(context, MaterialPageRoute(builder: page));
          },
          borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
          child: Container(
            constraints: const BoxConstraints(minHeight: 88),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
              border: Border.all(color: meta.color.withValues(alpha: 0.45)),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm + AppSpacing.xs,
            ),
            child: Row(
              children: [
                Icon(meta.icon, color: meta.color, size: 28),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(meta.label, style: AppTypography.cardTitle),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        meta.description,
                        style: AppTypography.caption,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TuiStatusDot(color: statusColor),
                        const SizedBox(width: AppSpacing.xs),
                        Text(
                          statusLabel,
                          style: AppTypography.micro.copyWith(color: statusColor),
                        ),
                      ],
                    ),
                    if (service.updateAvailable) ...[
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        'UPDATE',
                        style: AppTypography.micro.copyWith(color: AppColors.update),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
