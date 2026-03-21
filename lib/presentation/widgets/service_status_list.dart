import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceStatusList extends StatelessWidget {
  final List<dynamic> services;

  const ServiceStatusList({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A).withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Wrap(
        spacing: 12,
        runSpacing: 8,
        children: services.map((service) => _buildTuiServiceItem(service)).toList(),
      ),
    );
  }

  Widget _buildTuiServiceItem(dynamic service) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.circle,
          size: 8,
          color: service.isOnline ? Colors.greenAccent : Colors.redAccent,
        ),
        const SizedBox(width: 6),
        Text(
          service.name.replaceAll(' ', '_').toUpperCase(),
          style: GoogleFonts.jetBrainsMono(
            color: service.isOnline ? Colors.white70 : Colors.white24,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
