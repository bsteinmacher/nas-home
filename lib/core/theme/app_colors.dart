import 'package:flutter/material.dart';

/// NAS_TERMINAL color palette
abstract class AppColors {
  // Base background and surface
  static const background = Color(0xFF0F0F0F);
  static const surface = Color(0xFF1E1E1E);
  static const surfaceLighter = Color(0xFF2A2A2A);

  // Terminal brand colors
  static const terminalGreen = Color(0xFF69F0AE); // GreenAccent
  static const terminalMuted = Color(0xFF3D3D3D);
  
  // Text hierarchy
  static const textPrimary = Colors.white;
  static const textSecondary = Colors.white70;
  static const textMuted = Colors.white24;

  // Semantic service colors
  static const media = Colors.purpleAccent;
  static const music = Colors.blueAccent;
  static const download = Colors.orangeAccent;
  static const photos = Colors.pinkAccent;
  static const files = Colors.lightBlueAccent;

  // Terminal Gradients
  static const terminalGradient = LinearGradient(
    colors: [
      files,
      music,
      media,
      photos,
    ],
  );
}
