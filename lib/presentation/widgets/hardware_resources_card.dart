import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../../domain/entities/hardware_info.dart';

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
          _buildTuiProgressBar('CPU_LOAD', info.cpuUsage / 100, '${info.cpuUsage.toStringAsFixed(1)}%'),
          const SizedBox(height: AppSpacing.sm + AppSpacing.xs),
          _buildTuiProgressBar(
            'RAM_USAGE',
            info.ramUsed / info.ramTotal,
            '${info.ramUsed.toStringAsFixed(1)}GB/${info.ramTotal.toStringAsFixed(1)}GB',
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

  Widget _buildTuiProgressBar(String label, double percent, String trailing) {
    const int totalBars = 20;
    double clampedPercent = percent.clamp(0.0, 1.0);
    int filledBars = (clampedPercent * totalBars).round();
    String filledPart = '#' * filledBars;
    String totalBarPlaceholder = '#' * totalBars;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.sectionHeader,
        ),
        const SizedBox(height: AppSpacing.xs),
        Row(
          children: [
            Text(
              '[',
              style: AppTypography.baseStyle.copyWith(
                color: AppColors.textPrimary,
                fontSize: 12,
                height: 1.0,
              ),
            ),
            Stack(
              children: [
                Text(
                  totalBarPlaceholder,
                  style: AppTypography.baseStyle.copyWith(
                    color: AppColors.textMuted.withValues(alpha: 0.1),
                    fontSize: 14,
                    height: 1.0,
                  ),
                ),
                if (filledBars > 0)
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) {
                      final charWidth = bounds.width / filledBars;
                      final fullWidth = charWidth * totalBars;
                      
                      return const LinearGradient(
                        colors: [
                          AppColors.files,
                          AppColors.music,
                          AppColors.media,
                          AppColors.photos,
                        ],
                      ).createShader(Rect.fromLTWH(0, 0, fullWidth, bounds.height));
                    },
                    child: Text(
                      filledPart,
                      style: AppTypography.baseStyle.copyWith(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                        height: 1.0,
                      ),
                    ),
                  ),
              ],
            ),
            Text(
              ']',
              style: AppTypography.baseStyle.copyWith(
                color: AppColors.textPrimary,
                fontSize: 12,
                height: 1.0,
              ),
            ),
            const Spacer(),
            Text(
              trailing,
              style: AppTypography.moduleSublabel.copyWith(color: AppColors.textSecondary),
            ),
          ],
        ),
      ],
    );
  }
}
