import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/theme/app_spacing.dart';
import 'tui_status_dot.dart';

Color jobStatusDotColor(String status) {
  switch (status) {
    case 'done':
      return AppColors.terminalGreen;
    case 'error':
      return Colors.redAccent;
    default:
      return AppColors.radarr;
  }
}

/// ASCII-style progress bar with terminal aesthetics
class TuiProgressBar extends StatelessWidget {
  final String label;
  final double percent;
  final String trailing;
  final Color? statusDot;
  final int totalBars;

  const TuiProgressBar({
    super.key,
    required this.label,
    required this.percent,
    required this.trailing,
    this.statusDot,
    this.totalBars = 20,
  });

  @override
  Widget build(BuildContext context) {
    // Clamp percentage between 0.0 and 1.0
    final double clampedPercent = percent.clamp(0.0, 1.0);
    final int filledBars = (clampedPercent * totalBars).round();
    final String filledPart = '#' * filledBars;
    final String totalBarPlaceholder = '#' * totalBars;

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
                // Empty bar background
                Text(
                  totalBarPlaceholder,
                  style: AppTypography.baseStyle.copyWith(
                    color: AppColors.textMuted.withValues(alpha: 0.1),
                    fontSize: 14,
                    height: 1.0,
                  ),
                ),
                // Gradient filled part
                if (filledBars > 0)
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) {
                      // Calculate width mapping for the gradient
                      final charWidth = bounds.width / filledBars;
                      final fullWidth = charWidth * totalBars;
                      
                      return AppColors.terminalGradient.createShader(
                        Rect.fromLTWH(0, 0, fullWidth, bounds.height),
                      );
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
            if (statusDot case final Color dot) ...[
              const SizedBox(width: AppSpacing.xs),
              TuiStatusDot(color: dot),
            ],
          ],
        ),
      ],
    );
  }
}
