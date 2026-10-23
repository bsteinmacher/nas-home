import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

enum TuiToastKind { info, success, error }

/// Floating terminal notice. Status is a text prefix, not color alone.
class TuiToast {
  static void show(
    BuildContext context,
    String message, {
    TuiToastKind kind = TuiToastKind.info,
  }) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();

    final (prefix, color) = switch (kind) {
      TuiToastKind.success => ('[OK]', AppColors.terminalGreen),
      TuiToastKind.error => ('[ERR]', AppColors.offline),
      TuiToastKind.info => ('[INFO]', AppColors.textSecondary),
    };

    final textStyle = AppTypography.body.copyWith(
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    );

    messenger.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.fixed,
        backgroundColor: AppColors.surfaceLighter,
        elevation: 16,
        duration: kind == TuiToastKind.error
            ? const Duration(days: 1)
            : const Duration(seconds: 4),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSpacing.borderRadius),
          ),
        ),
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 3,
              height: 22,
              margin: const EdgeInsets.only(top: 2),
              color: color,
            ),
            const SizedBox(width: AppSpacing.sm + AppSpacing.xs),
            Expanded(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '$prefix ',
                      style: textStyle.copyWith(color: color, fontWeight: FontWeight.w700),
                    ),
                    TextSpan(text: message, style: textStyle),
                  ],
                ),
              ),
            ),
          ],
        ),
        action: kind == TuiToastKind.error
            ? SnackBarAction(
                label: 'DISMISS',
                textColor: AppColors.textPrimary,
                onPressed: () {},
              )
            : null,
      ),
    );
  }
}
