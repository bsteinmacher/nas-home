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
          _buildTuiProgressBar('MEM_USAGE', 0.62, '4.9GB/8GB'),
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
                  color: Colors.orangeAccent.withValues(alpha: 0.7),
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
    String barString = '[' + '#' * filledBars + '-' * (totalBars - filledBars) + ']';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label.padRight(10),
              style: GoogleFonts.jetBrainsMono(
                color: Colors.greenAccent.withValues(alpha: 0.7),
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text(
              trailing,
              style: GoogleFonts.jetBrainsMono(color: Colors.white70, fontSize: 10),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          barString,
          style: GoogleFonts.jetBrainsMono(
            color: Colors.greenAccent,
            fontSize: 14,
            height: 1.0,
          ),
        ),
      ],
    );
  }
}
