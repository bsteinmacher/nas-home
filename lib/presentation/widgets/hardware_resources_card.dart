import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HardwareResourcesCard extends StatelessWidget {
  const HardwareResourcesCard({super.key});

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
                'HOST: LENOVO-E73',
                style: GoogleFonts.jetBrainsMono(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildTuiProgressBar('CPU_LOAD', 0.28, '28%'),
          const SizedBox(height: 12),
          _buildTuiProgressBar('RAM_USAGE', 0.62, '4.9GB/8GB'),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'UPTIME: 12d 04h 32m',
                style: GoogleFonts.jetBrainsMono(color: Colors.white38, fontSize: 10),
              ),
              Text(
                'TEMP: 42°C',
                style: GoogleFonts.jetBrainsMono(
                  color: Colors.orangeAccent.withValues(alpha: 0.6),
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
    int filledBars = (percent * totalBars).round();
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
                // Fundo da barra (parte vazia)
                Text(
                  totalBarPlaceholder,
                  style: GoogleFonts.jetBrainsMono(
                    color: Colors.white10,
                    fontSize: 14,
                    height: 1.0,
                  ),
                ),
                // Parte preenchida com o degradê estendido
                if (filledBars > 0)
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) {
                      // Calculamos a largura total teórica para o degradê
                      // (largura de 1 char * total de bars)
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
