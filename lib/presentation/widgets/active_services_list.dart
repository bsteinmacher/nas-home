import 'package:flutter/material.dart';
import 'nas_service_card.dart';

class ActiveServicesList extends StatelessWidget {
  final List<dynamic> services;

  const ActiveServicesList({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    // Sort services alphabetical
    final sortedServices = List<dynamic>.from(services)
      ..sort((a, b) => a.name.compareTo(b.name));

    return Column(
      children: sortedServices.map((service) => NasServiceCard(service: service)).toList(),
    );
  }
}
