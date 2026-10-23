import 'package:flutter/material.dart';

class TuiStatusDot extends StatelessWidget {
  final Color color;

  const TuiStatusDot({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.circle, size: 6, color: color);
  }
}
