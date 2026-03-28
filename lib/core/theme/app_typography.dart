import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Font style definitions
abstract class AppTypography {
  // Base font family
  static final baseStyle = GoogleFonts.jetBrainsMono();

  // Terminal primary title
  static final terminalTitle = baseStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.terminalGreen,
  );

  // Section labels (e.g., // HARDWARE)
  static final sectionHeader = baseStyle.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: AppColors.textMuted,
  );

  // Module/Service labels
  static final moduleLabel = baseStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Small descriptors
  static final moduleSublabel = baseStyle.copyWith(
    fontSize: 9,
    color: AppColors.textMuted,
  );

  // Action status (e.g., READY)
  static final statusBadge = baseStyle.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.bold,
  );
}
