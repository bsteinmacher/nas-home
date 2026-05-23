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
  static const seerr = Colors.purpleAccent;
  static const jellyfin = Color(0xFF00A4DC);
  static const lidarr = Colors.blueAccent;
  static const adguard = Colors.blueAccent;
  static const radarr = Color(0xFFFFCC33);
  static const sonarr = Color(0xFF00ADEE);
  static const prowlarr = Color(0xFFFF7A00);
  static const download = Colors.orangeAccent;
  static const upload = Colors.tealAccent;
  static const photos = Colors.pinkAccent;
  static const files = Colors.lightBlueAccent;
  static const security = Color(0xFFE91E63);
  static const networking = Color(0xFF00BCD4);
  static const automation = Color(0xFF4CAF50);
  static const optimization = Color(0xFF9C27B0);
  static const git = Color(0xFFF05032);
  static const automationAlt = Color(0xFFE34C26);
  static const flaresolverr = Color(0xFFFBC02D);

  // Terminal Gradients
  static const terminalGradient = LinearGradient(
    colors: [
      files,
      lidarr,
      seerr,
      photos,
    ],
  );
}
