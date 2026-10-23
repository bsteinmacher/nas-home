import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../domain/entities/nas_service.dart';
import '../../../service_catalog.dart';
import '../../../widgets/service_actions.dart';

class AttentionPanel extends StatelessWidget {
  final List<NasService> services;

  const AttentionPanel({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    final attention = services.where((service) {
      if (!service.isDeployed) return false;
      return !service.isOnline || service.updateAvailable;
    }).toList()
      ..sort((a, b) {
        final aOffline = !a.isOnline;
        final bOffline = !b.isOnline;
        if (aOffline != bOffline) return aOffline ? -1 : 1;
        return a.name.compareTo(b.name);
      });

    if (attention.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...attention.map((service) => _AttentionRow(service: service)),
        ],
      ),
    );
  }
}

class _AttentionRow extends StatelessWidget {
  final NasService service;

  const _AttentionRow({required this.service});

  @override
  Widget build(BuildContext context) {
    final meta = serviceMetaFor(service.name);
    final offline = !service.isOnline;
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm + AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(meta.label, style: AppTypography.label),
                const SizedBox(height: AppSpacing.xs),
                if (service.updateAvailable)
                  Text(
                    '${localVersionLabel(service)} → ${remoteVersionLabel(service)}',
                    style: AppTypography.caption,
                  )
                else
                  Text(
                    'Sem resposta neste host.',
                    style: AppTypography.caption,
                  ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          if (service.updateAvailable)
            _UpdateButton(service: service, color: meta.color)
          else if (offline)
            Text(
              '[OFFLINE]',
              style: AppTypography.micro.copyWith(color: AppColors.offline),
            ),
        ],
      ),
    );
  }
}

class _UpdateButton extends StatelessWidget {
  final NasService service;
  final Color color;

  const _UpdateButton({required this.service, required this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showServiceUpdateDialog(context, service, color),
      style: TextButton.styleFrom(
        foregroundColor: AppColors.update,
        minimumSize: const Size(44, 44),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
        side: const BorderSide(color: AppColors.update),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
        ),
      ),
      child: Text(
        'UPDATE',
        style: AppTypography.micro.copyWith(color: AppColors.update),
      ),
    );
  }
}
