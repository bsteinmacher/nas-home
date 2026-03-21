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
  // Sequência de 8 frames (Braille 8-dot)
  // Simula uma rotação suave apagando um ponto por vez em um bloco de 4x2
  static const List<String> _frames = [
    '⣷', '⣯', '⣟', '⡿', '⢿', '⣻', '⣽', '⣾'
  ];
  
  int _currentFrame = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // 100ms é a velocidade clássica para spinners de 8 frames
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
      width: widget.fontSize * 1.5, // Garante espaço para o caractere sem jitter
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
