import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

class ErrorStateWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const ErrorStateWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '[!] CRITICAL_ERROR: $message',
            style: AppTypography.moduleLabel.copyWith(color: Colors.redAccent, fontSize: 12),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.md),
          TextButton(
            onPressed: onRetry,
            child: Text(
              '> REBOOT_SYSTEM',
              style: AppTypography.moduleLabel.copyWith(color: AppColors.terminalGreen),
            ),
          ),
        ],
      ),
    );
  }
}
