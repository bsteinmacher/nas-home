import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

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
        children: sortedServices.map((service) => _buildTuiServiceItem(service)).toList(),
      ),
    );
  }

  Widget _buildTuiServiceItem(dynamic service) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.circle,
          size: 6, // Reduzi um pouco para ficar mais elegante sem o espaço
          color: service.isOnline ? AppColors.terminalGreen : Colors.redAccent,
        ),
        // Removido SizedBox entre a bolinha e o texto
        Text(
          ' ${service.name.replaceAll(' ', '_').toUpperCase()}', // Adicionei apenas um espaço de texto para não ficar grudado no pixel
          style: AppTypography.moduleSublabel.copyWith(
            color: service.isOnline ? AppColors.textSecondary : AppColors.textMuted,
            fontSize: 9,
          ),
        ),
      ],
    );
  }
}
