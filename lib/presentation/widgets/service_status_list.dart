import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

class ServiceStatusList extends StatelessWidget {
  final List<dynamic> services;

  const ServiceStatusList({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.sm + AppSpacing.xs),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
      ),
      child: Wrap(
        spacing: AppSpacing.sm + AppSpacing.xs,
        runSpacing: AppSpacing.sm,
        children: services.map((service) => _buildTuiServiceItem(service)).toList(),
      ),
    );
  }

  Widget _buildTuiServiceItem(dynamic service) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.circle,
          size: 8,
          color: service.isOnline ? AppColors.terminalGreen : Colors.redAccent,
        ),
        const SizedBox(width: AppSpacing.sm),
        Text(
          service.name.replaceAll(' ', '_').toUpperCase(),
          style: AppTypography.moduleSublabel.copyWith(
            color: service.isOnline ? AppColors.textSecondary : AppColors.textMuted,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
