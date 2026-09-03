import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';

class ServiceStatusList extends StatelessWidget {
  final List<dynamic> services;

  const ServiceStatusList({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    // Sort services: online first, then alphabetical
    final sortedServices = List<dynamic>.from(services)
      ..sort((a, b) {
        if (a.isOnline && !b.isOnline) return -1;
        if (!a.isOnline && b.isOnline) return 1;
        return a.name.compareTo(b.name);
      });

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.sm + AppSpacing.xs),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
      ),
      child: Wrap(
        spacing: AppSpacing.md, // Aumentei o espaçamento entre itens para compensar a falta de espaço interna
        runSpacing: AppSpacing.sm,
        children: sortedServices.map((service) => _buildTuiServiceItem(context, service)).toList(),
      ),
    );
  }

  Widget _buildTuiServiceItem(BuildContext context, dynamic service) {
    final isDeployed = service.isDeployed as bool? ?? true;
    final dotColor = !isDeployed
        ? AppColors.textMuted
        : (service.isOnline ? AppColors.terminalGreen : Colors.redAccent);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.circle,
          size: 6,
          color: dotColor,
        ),
        Text(
          ' ${service.name.replaceAll(' ', '_').toUpperCase()}',
          style: AppTypography.moduleSublabel.copyWith(
            color: isDeployed
                ? (service.isOnline ? AppColors.textSecondary : AppColors.textMuted)
                : AppColors.textMuted,
            fontSize: 9,
          ),
        ),
        if (!isDeployed)
          Text(
            ' [ND]',
            style: AppTypography.moduleSublabel.copyWith(
              color: AppColors.textMuted,
              fontSize: 8,
            ),
          ),
        if (service.updateAvailable)
          const Padding(
            padding: EdgeInsets.only(left: 2.0),
            child: Icon(
              Icons.info_outline,
              size: 10,
              color: Colors.blueAccent,
            ),
          ),
      ],
    );
  }
}
