import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BrailleSpinner extends StatefulWidget {
  final double fontSize;
  final Color color;

  const BrailleSpinner({
    super.key,
    this.fontSize = 20,
    this.color = Colors.greenAccent,
  });

  @override
  State<BrailleSpinner> createState() => _BrailleSpinnerState();
}

class _BrailleSpinnerState extends State<BrailleSpinner> {
  // 8-frame sequence (Braille 8-dot)
  // Simulates smooth rotation by clearing one dot at a time in a 4x2 block
  static const List<String> _frames = [
    '⣷', '⣯', '⣟', '⡿', '⢿', '⣻', '⣽', '⣾'
  ];
  
  int _currentFrame = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // 100ms is the standard speed for 8-frame spinners
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (mounted) {
        setState(() {
          _currentFrame = (_currentFrame + 1) % _frames.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.fontSize * 1.5, // Ensures enough space to avoid jitter
      child: Center(
        child: Text(
          _frames[_currentFrame],
          textAlign: TextAlign.center,
          style: GoogleFonts.jetBrainsMono(
            color: widget.color,
            fontSize: widget.fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
