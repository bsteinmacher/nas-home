import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

class TuiDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final List<Widget> actions;
  final Color themeColor;

  const TuiDialog({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
    this.themeColor = AppColors.terminalGreen,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.background,
          border: Border.all(color: AppColors.textPrimary.withValues(alpha: 0.2), width: 1),
          borderRadius: BorderRadius.zero,
        ),
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Text(
                  '>_STATUS: ',
                  style: AppTypography.moduleLabel.copyWith(color: AppColors.textPrimary),
                ),
                Expanded(
                  child: Text(
                    title.toUpperCase(),
                    style: AppTypography.moduleLabel.copyWith(color: themeColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            // Divider estilo terminal
            Container(
              height: 1,
              width: double.infinity,
              color: themeColor.withValues(alpha: 0.2),
            ),
            const SizedBox(height: AppSpacing.md),
            // Content
            DefaultTextStyle(
              style: AppTypography.moduleSublabel,
              child: content,
            ),
            const SizedBox(height: AppSpacing.lg),
            // Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: actions,
            ),
          ],
        ),
      ),
    );
  }
}

class TuiDialogButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isPrimary;
  final Color? color;

  const TuiDialogButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isPrimary = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (isPrimary) {
      final bgColor = color ?? AppColors.terminalGreen;
      return InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.zero,
          ),
          child: Text(
            label.toUpperCase(),
            style: AppTypography.statusBadge.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    // Botão secundário: apenas texto no cinza claro do app
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: AppColors.textSecondary,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      child: Text(
        label.toUpperCase(),
        style: AppTypography.statusBadge,
      ),
    );
  }
}
