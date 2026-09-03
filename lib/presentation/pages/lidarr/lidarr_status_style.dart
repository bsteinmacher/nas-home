import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

Color lidarrStatusColor(String label) {
  switch (label) {
    case 'DOWNLOADED':
      return AppColors.terminalGreen;
    case 'PARTIAL':
      return Colors.orangeAccent;
    case 'MISSING':
    case 'SEARCH':
      return AppColors.lidarr;
    case 'DOWNLOADING':
      return Colors.orangeAccent;
    case 'PREVIEW':
      return AppColors.textMuted;
    default:
      return AppColors.textSecondary;
  }
}

Color lidarrActionButtonColor(String label) {
  switch (label) {
    case 'DOWNLOADED':
      return Colors.greenAccent.withValues(alpha: 0.8);
    case 'DOWNLOADING':
      return Colors.orangeAccent.withValues(alpha: 0.8);
    case 'SEARCH':
      return AppColors.lidarr;
    case 'PREVIEW':
      return AppColors.textMuted;
    default:
      return AppColors.lidarr;
  }
}
