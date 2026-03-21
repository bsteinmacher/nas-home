import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorStateWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const ErrorStateWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '[!] CRITICAL_ERROR: $message',
            style: GoogleFonts.jetBrainsMono(color: Colors.redAccent, fontSize: 12),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: onRetry,
            child: Text(
              '> REBOOT_SYSTEM',
              style: GoogleFonts.jetBrainsMono(color: Colors.greenAccent),
            ),
          ),
        ],
      ),
    );
  }
}
