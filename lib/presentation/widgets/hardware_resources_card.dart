import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../../domain/entities/hardware_info.dart';
import 'tui_progress_bar.dart';

class HardwareResourcesCard extends StatelessWidget {
  final HardwareInfo info;

  const HardwareResourcesCard({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
        border: Border.all(color: AppColors.textMuted.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.dns, color: AppColors.terminalGreen, size: 14),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'HOST: ${info.hostname}',
                style: AppTypography.moduleLabel.copyWith(fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          TuiProgressBar(
            label: 'CPU_LOAD',
            percent: info.cpuUsage / 100,
            trailing: '${info.cpuUsage.toStringAsFixed(1)}%',
          ),
          const SizedBox(height: AppSpacing.sm + AppSpacing.xs),
          TuiProgressBar(
            label: 'RAM_USAGE',
            percent: info.ramUsed / info.ramTotal,
            trailing: '${info.ramUsed.toStringAsFixed(1)}GB/${info.ramTotal.toStringAsFixed(1)}GB',
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'UPTIME: ${info.uptime}',
                style: AppTypography.moduleSublabel.copyWith(color: AppColors.textMuted),
              ),
              Text(
                'TEMP: ${info.temperature.toStringAsFixed(0)}°C',
                style: AppTypography.moduleSublabel.copyWith(
                  color: info.temperature > 60 ? Colors.redAccent : AppColors.download.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
