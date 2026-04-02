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
          const SizedBox(height: AppSpacing.sm + AppSpacing.xs),
          TuiProgressBar(
            label: 'SSD_SYSTEM',
            percent: info.ssdTotal > 0 ? info.ssdUsed / info.ssdTotal : 0,
            trailing: '${info.ssdUsed.toStringAsFixed(1)}GB/${info.ssdTotal.toStringAsFixed(0)}GB',
          ),
          const SizedBox(height: AppSpacing.sm + AppSpacing.xs),
          TuiProgressBar(
            label: 'HDD_DATA',
            percent: info.hddTotal > 0 ? info.hddUsed / info.hddTotal : 0,
            trailing: '${info.hddUsed.toStringAsFixed(0)}GB/${(info.hddTotal / 1024).toStringAsFixed(1)}TB',
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              const Icon(Icons.arrow_downward, color: AppColors.download, size: 18),
              const SizedBox(width: AppSpacing.xs),
              Text(
                '${info.downloadSpeed.toStringAsFixed(1)} MB/s',
                style: AppTypography.baseStyle.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 10.5,
                ),
              ),
              const SizedBox(width: AppSpacing.lg),
              const Icon(Icons.arrow_upward, color: AppColors.upload, size: 18),
              const SizedBox(width: AppSpacing.xs),
              Text(
                '${info.uploadSpeed.toStringAsFixed(1)} MB/s',
                style: AppTypography.baseStyle.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 10.5,
                ),
              ),
            ],
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
