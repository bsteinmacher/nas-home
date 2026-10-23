import 'package:flutter/material.dart';

/// NAS_TERMINAL color palette.
///
/// Text tokens are opaque so contrast does not depend on the surface behind
/// them. [textMuted] is the quietest text that still clears 4.5:1 on [surface].
/// [textDisabled] is only for unavailable controls, which are exempt from that
/// floor.
abstract class AppColors {
  // Base background and surface
  static const background = Color(0xFF0F0F0F);
  static const surface = Color(0xFF1E1E1E);
  static const surfaceLighter = Color(0xFF2A2A2A);

  // Terminal brand colors
  static const terminalGreen = Color(0xFF69F0AE); // GreenAccent
  static const terminalMuted = Color(0xFF3D3D3D);

  // Text hierarchy (composited against [surface], then flattened)
  static const textPrimary = Color(0xFFF2F2F2);
  static const textSecondary = Color(0xFFBCBCBC); // white70 on surface, 8.7:1
  static const textMuted = Color(0xFFA3A3A3); // white60 on surface, 6.7:1
  static const textDisabled = Color(0xFF737373); // white38 on surface

  // Structure, not text
  static const borderSubtle = Color(0x1AFFFFFF); // white 10%
  static const barTrack = Color(0x24FFFFFF); // white 14%

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
  static const syncthing = Color(0xFFFFAB40); // orangeAccent, next to download
  static const offline = Color(0xFFFF5252);
  static const update = Color(0xFF448AFF);

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
