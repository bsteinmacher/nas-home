import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/di/injection_container.dart';
import '../blocs/nas_status_bloc.dart';
import 'settings_page.dart';
import 'media_page.dart';
import 'music_page.dart';

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
            loading: () => const Center(child: CircularProgressIndicator(color: Colors.greenAccent, strokeWidth: 2)),
            error: (message) => _buildErrorState(message),
            loaded: (services) => _buildDashboard(services),
          );
        },
      ),
    );
  }

  Widget _buildErrorState(String message) {
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
            onPressed: () => context.read<NasStatusBloc>().add(const RefreshRequested()),
            child: Text('> REBOOT_SYSTEM', style: GoogleFonts.jetBrainsMono(color: Colors.greenAccent)),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboard(List<dynamic> services) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '// HARDWARE_RESOURCES',
            style: GoogleFonts.jetBrainsMono(
              color: Colors.white24,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildTuiHeader(),
          const SizedBox(height: 24),
          Text(
            '// SERVICE_STATUS_ALL',
            style: GoogleFonts.jetBrainsMono(
              color: Colors.white24,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildTuiServiceList(services),
          const SizedBox(height: 32),
          Text(
            '// QUICK_ACCESS_MODULES',
            style: GoogleFonts.jetBrainsMono(
              color: Colors.white24,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildActiveServicesGrid(services),
        ],
      ),
    );
  }

  Widget _buildTuiHeader() {
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
                style: GoogleFonts.jetBrainsMono(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
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
                style: GoogleFonts.jetBrainsMono(color: Colors.orangeAccent.withValues(alpha: 0.7), fontSize: 10),
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

  Widget _buildTuiServiceList(List<dynamic> services) {
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

  Widget _buildActiveServicesGrid(List<dynamic> services) {
    final activeNames = ['Jellyseerr', 'Navidrome', 'qBittorrent', 'Immich', 'Nextcloud'];
    final activeServices = services.where((s) => activeNames.contains(s.name)).toList();

    return Column(
      children: activeServices.map((service) => _buildActiveServiceCard(service)).toList(),
    );
  }

  Widget _buildActiveServiceCard(dynamic service) {
    IconData icon;
    Color color;
    String subLabel;

    switch (service.name) {
      case 'Jellyseerr':
        icon = Icons.movie_outlined;
        color = Colors.purpleAccent;
        subLabel = 'SEARCH_&_REQUEST_MEDIA';
        break;
      case 'Navidrome':
        icon = Icons.music_note_outlined;
        color = Colors.blueAccent;
        subLabel = 'MUSIC_LIBRARY_BROWSER';
        break;
      case 'qBittorrent':
        icon = Icons.download_for_offline_outlined;
        color = Colors.orangeAccent;
        subLabel = 'DOWNLOAD_MANAGER';
        break;
      case 'Immich':
        icon = Icons.photo_library_outlined;
        color = Colors.pinkAccent;
        subLabel = 'PHOTO_&_VIDEO_GALLERY';
        break;
      case 'Nextcloud':
        icon = Icons.folder_shared_outlined;
        color = Colors.lightBlueAccent;
        subLabel = 'FILES_&_CLOUD_STORAGE';
        break;
      default:
        icon = Icons.bolt;
        color = Colors.greenAccent;
        subLabel = 'ACTIVE_MODULE';
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          if (service.name == 'Jellyseerr') {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MediaPage()));
          } else if (service.name == 'Navidrome') {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MusicPage()));
          }
        },
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: color.withValues(alpha: 0.2)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.name.toUpperCase(),
                      style: GoogleFonts.jetBrainsMono(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      subLabel,
                      style: GoogleFonts.jetBrainsMono(
                        color: Colors.white24,
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: color.withValues(alpha: 0.3)),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Text(
                      'READY',
                      style: GoogleFonts.jetBrainsMono(
                        color: color,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(Icons.chevron_right, color: color, size: 12),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
