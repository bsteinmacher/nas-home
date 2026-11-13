import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_typography.dart';

/// NAS_TERMINAL application theme
class AppTheme {
  static ThemeData get darkTheme {
    final textTheme = GoogleFonts.jetBrainsMonoTextTheme(
      TextTheme(
        headlineMedium: AppTypography.title,
        titleLarge: AppTypography.cardTitle,
        titleMedium: AppTypography.label,
        bodyLarge: AppTypography.body,
        bodyMedium: AppTypography.body.copyWith(fontWeight: FontWeight.w500),
        bodySmall: AppTypography.caption,
        labelLarge: AppTypography.label,
        labelMedium: AppTypography.micro,
        labelSmall: AppTypography.sectionHeader,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        surface: AppColors.surface,
        primary: AppColors.terminalGreen,
        onPrimary: Colors.black,
        error: AppColors.offline,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.terminalGreen,
        size: 24,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTypography.title,
        iconTheme: const IconThemeData(
          color: AppColors.terminalGreen,
          size: 24,
        ),
        actionsIconTheme: const IconThemeData(
          color: AppColors.terminalGreen,
          size: 24,
        ),
      ),
      textTheme: textTheme,
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          minimumSize: const Size(AppSpacing.minTouch, AppSpacing.minTouch),
          iconSize: 24,
          foregroundColor: AppColors.terminalGreen,
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        contentTextStyle: AppTypography.body.copyWith(fontWeight: FontWeight.w500),
        actionTextColor: AppColors.textPrimary,
        elevation: 0,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSpacing.borderRadius),
          ),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.background,
        titleTextStyle: AppTypography.label,
        contentTextStyle: AppTypography.body,
      ),
      tooltipTheme: TooltipThemeData(
        textStyle: AppTypography.caption.copyWith(color: AppColors.textPrimary),
        decoration: BoxDecoration(
          color: AppColors.surfaceLighter,
          borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
          border: Border.all(color: AppColors.borderSubtle),
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.terminalGreen,
      ),
    );
  }
}
