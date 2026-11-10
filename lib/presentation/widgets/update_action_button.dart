import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

/// Text action for an available update: blue icon, then UPDATE. No border.
class UpdateActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;

  const UpdateActionButton({
    super.key,
    required this.onPressed,
    this.label = 'UPDATE',
  });

  @override
  Widget build(BuildContext context) {
    final color = onPressed == null ? AppColors.textDisabled : AppColors.update;
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: color,
        minimumSize: const Size(44, 44),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.system_update_alt, size: 18, color: color),
          const SizedBox(width: AppSpacing.xs),
          Text(label, style: AppTypography.label.copyWith(color: color)),
        ],
      ),
    );
  }
}
