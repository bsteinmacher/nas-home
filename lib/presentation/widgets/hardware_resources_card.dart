import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/entities/hardware_info.dart';

class HardwareResourcesCard extends StatelessWidget {
  final HardwareInfo info;

  const HardwareResourcesCard({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.dns, color: Colors.greenAccent, size: 14),
              const SizedBox(width: 8),
              Text(
                'HOST: ${info.hostname}',
                style: GoogleFonts.jetBrainsMono(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildTuiProgressBar('CPU_LOAD', info.cpuUsage / 100, '${info.cpuUsage.toStringAsFixed(1)}%'),
          const SizedBox(height: 12),
          _buildTuiProgressBar(
            'RAM_USAGE',
            info.ramUsed / info.ramTotal,
            '${info.ramUsed.toStringAsFixed(1)}GB/${info.ramTotal.toStringAsFixed(1)}GB',
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'UPTIME: ${info.uptime}',
                style: GoogleFonts.jetBrainsMono(color: Colors.white38, fontSize: 10),
              ),
              Text(
                'TEMP: ${info.temperature.toStringAsFixed(0)}°C',
                style: GoogleFonts.jetBrainsMono(
                  color: info.temperature > 60 ? Colors.redAccent : Colors.orangeAccent.withValues(alpha: 0.6),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTuiProgressBar(String label, double percent, String trailing) {
    const int totalBars = 20;
    // Ensure percent is between 0.0 and 1.0
    double clampedPercent = percent.clamp(0.0, 1.0);
    int filledBars = (clampedPercent * totalBars).round();
    String filledPart = '#' * filledBars;
    String totalBarPlaceholder = '#' * totalBars;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.jetBrainsMono(
            color: Colors.white30,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              '[',
              style: GoogleFonts.jetBrainsMono(
                color: Colors.white,
                fontSize: 12,
                height: 1.0,
              ),
            ),
            Stack(
              children: [
                // Bar background (empty part)
                Text(
                  totalBarPlaceholder,
                  style: GoogleFonts.jetBrainsMono(
                    color: Colors.white10,
                    fontSize: 14,
                    height: 1.0,
                  ),
                ),
                // Filled part with extended gradient
                if (filledBars > 0)
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) {
                      // Calculate the theoretical total width for the gradient
                      // (width of 1 char * total bars)
                      final charWidth = bounds.width / filledBars;
                      final fullWidth = charWidth * totalBars;
                      
                      return const LinearGradient(
                        colors: [
                          Color(0xFF0082C9), // Nextcloud Blue
                          Color(0xFF236997), // Navidrome Blue
                          Color(0xFFF132D2), // Jellyseerr Pink
                          Color(0xFFDA3731), // Immich Red
                        ],
                      ).createShader(Rect.fromLTWH(0, 0, fullWidth, bounds.height));
                    },
                    child: Text(
                      filledPart,
                      style: GoogleFonts.jetBrainsMono(
                        color: Colors.white,
                        fontSize: 14,
                        height: 1.0,
                      ),
                    ),
                  ),
              ],
            ),
            Text(
              ']',
              style: GoogleFonts.jetBrainsMono(
                color: Colors.white,
                fontSize: 12,
                height: 1.0,
              ),
            ),
            const Spacer(),
            Text(
              trailing,
              style: GoogleFonts.jetBrainsMono(
                color: Colors.white70,
                fontSize: 10,
                height: 1.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
