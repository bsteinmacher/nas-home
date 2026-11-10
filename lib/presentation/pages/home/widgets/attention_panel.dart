import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../domain/entities/nas_service.dart';
import '../../../service_catalog.dart';
import '../../services/all_services_page.dart';

class UpdateNotice extends StatelessWidget {
  final List<NasService> services;

  const UpdateNotice({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    final count = services
        .where((service) => service.isDeployed && service.updateAvailable)
        .length;
    if (count == 0) return const SizedBox.shrink();

    final label = count == 1
        ? '1 atualização disponível'
        : '$count atualizações disponíveis';

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
      child: Material(
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
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
              border: Border.all(color: AppColors.update.withValues(alpha: 0.45)),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.system_update_alt,
                  color: AppColors.update,
                  size: 22,
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Text(
                    label,
                    style: AppTypography.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Icon(Icons.chevron_right, color: AppColors.update),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AttentionPanel extends StatelessWidget {
  final List<NasService> services;

  const AttentionPanel({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    final offline = services.where((service) {
      return service.isDeployed && !service.isOnline;
    }).toList()
      ..sort((a, b) => a.name.compareTo(b.name));

    if (offline.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...offline.map((service) => _OfflineRow(service: service)),
        ],
      ),
    );
  }
}

class _OfflineRow extends StatelessWidget {
  final NasService service;

  const _OfflineRow({required this.service});

  @override
  Widget build(BuildContext context) {
    final meta = serviceMetaFor(service.name);
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm + AppSpacing.xs),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(meta.label, style: AppTypography.label),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'Sem resposta neste host.',
                  style: AppTypography.caption,
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(
            '[OFFLINE]',
            style: AppTypography.micro.copyWith(color: AppColors.offline),
          ),
        ],
      ),
    );
  }
}
