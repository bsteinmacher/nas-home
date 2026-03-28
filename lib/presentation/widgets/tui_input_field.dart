import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

/// Terminal-style input field with fixed labels and command prompt
class TuiInputField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final ValueChanged<String>? onSubmitted;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final IconData? prefixIcon;

  const TuiInputField({
    super.key,
    this.label,
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.onSubmitted,
    this.suffixIcon,
    this.textInputAction,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            '// ${label!.toUpperCase().replaceAll(' ', '_')}',
            style: AppTypography.sectionHeader,
          ),
          const SizedBox(height: AppSpacing.xs),
        ],
        TextField(
          controller: controller,
          obscureText: obscureText,
          onSubmitted: onSubmitted,
          textInputAction: textInputAction,
          style: AppTypography.baseStyle.copyWith(
            fontSize: 14,
            color: AppColors.textPrimary,
          ),
          cursorColor: AppColors.terminalGreen,
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            hintStyle: AppTypography.moduleSublabel.copyWith(fontSize: 13),
            filled: true,
            fillColor: AppColors.surface,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: AppSpacing.md, right: AppSpacing.sm),
              child: Text(
                '>',
                style: AppTypography.baseStyle.copyWith(
                  color: AppColors.terminalGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.symmetric(
              vertical: AppSpacing.md,
              horizontal: AppSpacing.md,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
              borderSide: BorderSide(
                color: AppColors.textMuted.withValues(alpha: 0.1),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
              borderSide: const BorderSide(
                color: AppColors.terminalGreen,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
