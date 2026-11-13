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
      return AppColors.offline;
    default:
      return AppColors.radarr;
  }
}

/// ASCII-style progress bar with terminal aesthetics.
class TuiProgressBar extends StatelessWidget {
  final String label;
  final double percent;
  final String trailing;
  final Color? statusDot;
  final int totalBars;
  final String? error;

  const TuiProgressBar({
    super.key,
    required this.label,
    required this.percent,
    required this.trailing,
    this.statusDot,
    this.totalBars = 20,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    final double clampedPercent = percent.clamp(0.0, 1.0);
    final int filledBars = (clampedPercent * totalBars).round();
    final String filledPart = '#' * filledBars;
    final String totalBarPlaceholder = '#' * totalBars;
    final barStyle = AppTypography.metric.copyWith(
      color: AppColors.textPrimary,
      fontSize: 14,
      height: 1.0,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTypography.caption,
        ),
        const SizedBox(height: AppSpacing.xs),
        Row(
          children: [
            Text('[', style: barStyle),
            Flexible(
              child: Stack(
                children: [
                  Text(
                    totalBarPlaceholder,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: barStyle.copyWith(color: AppColors.barTrack),
                  ),
                  if (filledBars > 0)
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) {
                        final charWidth = bounds.width / filledBars;
                        final fullWidth = charWidth * totalBars;
                        return AppColors.terminalGradient.createShader(
                          Rect.fromLTWH(0, 0, fullWidth, bounds.height),
                        );
                      },
                      child: Text(
                        filledPart,
                        maxLines: 1,
                        style: barStyle,
                      ),
                    ),
                ],
              ),
            ),
            Text(']', style: barStyle),
            const SizedBox(width: AppSpacing.sm),
            Text(trailing, style: AppTypography.metric),
            if (statusDot case final Color dot) ...[
              const SizedBox(width: AppSpacing.xs),
              TuiStatusDot(color: dot),
            ],
          ],
        ),
        if (error != null && error!.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            '[ERR] $error',
            style: AppTypography.caption.copyWith(color: AppColors.offline),
          ),
        ],
      ],
    );
  }
}
