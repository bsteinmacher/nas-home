import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';

class BrailleSpinner extends StatefulWidget {
  final double fontSize;
  final Color color;

  const BrailleSpinner({
    super.key,
    this.fontSize = 20,
    this.color = AppColors.terminalGreen,
  });

  @override
  State<BrailleSpinner> createState() => _BrailleSpinnerState();
}

class _BrailleSpinnerState extends State<BrailleSpinner> {
  static const List<String> _frames = [
    '⣷', '⣯', '⣟', '⡿', '⢿', '⣻', '⣽', '⣾'
  ];
  
  int _currentFrame = 0;
  Timer? _timer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final reduceMotion = MediaQuery.disableAnimationsOf(context);
    if (reduceMotion) {
      _timer?.cancel();
      _timer = null;
      return;
    }
    _timer ??= Timer.periodic(const Duration(milliseconds: 100), (timer) {
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
      width: widget.fontSize * 1.5,
      child: Center(
        child: Text(
          _frames[_currentFrame],
          textAlign: TextAlign.center,
          style: GoogleFonts.jetBrainsMono(
            color: widget.color,
            fontSize: widget.fontSize,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
