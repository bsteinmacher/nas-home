import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

/// NAS_TERMINAL application theme
class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      
      // Configure global AppBar style
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(
          color: AppColors.terminalGreen,
          size: 26,
        ),
        actionsIconTheme: IconThemeData(
          color: AppColors.terminalGreen,
          size: 24,
        ),
      ),

      // Map Typography to Flutter TextTheme
      textTheme: TextTheme(
        headlineMedium: AppTypography.terminalTitle,
        labelSmall: AppTypography.sectionHeader,
        titleMedium: AppTypography.moduleLabel,
        bodySmall: AppTypography.moduleSublabel,
      ),

      // Progress indicator color
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.terminalGreen,
      ),
    );
  }
}
