import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/di/injection_container.dart';
import '../blocs/nas_status_bloc.dart';
import '../widgets/active_services_list.dart';
import '../widgets/error_state_widget.dart';
import '../widgets/hardware_resources_card.dart';
import '../widgets/service_status_list.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NasStatusBloc>()..add(const RefreshRequested()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        title: Text(
          'NAS_MONITOR_v1.0',
          style: GoogleFonts.jetBrainsMono(
            fontWeight: FontWeight.bold,
            color: Colors.greenAccent,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.greenAccent, size: 20),
            onPressed: () => context.read<NasStatusBloc>().add(const RefreshRequested()),
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white30, size: 20),
            onPressed: () async {
              final bloc = context.read<NasStatusBloc>();
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
              bloc.add(const RefreshRequested());
            },
          ),
        ],
      ),
      body: BlocBuilder<NasStatusBloc, NasStatusState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('Initializing system...')),
            loading: () => const Center(
              child: CircularProgressIndicator(
                color: Colors.greenAccent,
                strokeWidth: 2,
              ),
            ),
            error: (message) => ErrorStateWidget(
              message: message,
              onRetry: () => context.read<NasStatusBloc>().add(const RefreshRequested()),
            ),
            loaded: (services) => _buildDashboard(services),
          );
        },
      ),
    );
  }

  Widget _buildDashboard(List<dynamic> services) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('// HARDWARE_RESOURCES'),
          const HardwareResourcesCard(),
          const SizedBox(height: 24),
          _buildSectionHeader('// SERVICE_STATUS_ALL'),
          ServiceStatusList(services: services),
          const SizedBox(height: 32),
          _buildSectionHeader('// QUICK_ACCESS_MODULES'),
          ActiveServicesList(services: services),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: GoogleFonts.jetBrainsMono(
          color: Colors.white24,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
