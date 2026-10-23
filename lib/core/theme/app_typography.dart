import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Semantic type scale. Nothing in the UI should go below 12px.
///
/// Weights below 14px stay at 500 or heavier so JetBrains Mono stays legible.
/// Each style calls [GoogleFonts.jetBrainsMono] with its weight so the real
/// face loads. [TextStyle.copyWith] on a resolved style does not switch files.
abstract class AppTypography {
  static TextStyle _face({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
    double height = 1.3,
    double? letterSpacing,
    List<FontFeature>? fontFeatures,
  }) {
    return GoogleFonts.jetBrainsMono(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
      fontFeatures: fontFeatures,
    );
  }

  static final baseStyle = GoogleFonts.jetBrainsMono();

  static final title = _face(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.terminalGreen,
    height: 1.1,
  );

  static final terminalTitle = title;

  static final sectionHeader = _face(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.textMuted,
    height: 1.3,
    letterSpacing: 1.2,
  );

  static final cardTitle = _face(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static final body = _face(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static final label = _face(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static final moduleLabel = label;

  static final caption = _face(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  static final moduleSublabel = caption;

  static final micro = _face(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static final statusBadge = micro;

  static final metric = _face(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.2,
    fontFeatures: const [FontFeature.tabularFigures()],
  );
}
