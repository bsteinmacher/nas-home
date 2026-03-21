import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      appBar: AppBar(
        title: const Text('NAS Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<NasStatusBloc>().add(const RefreshRequested()),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
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
            initial: () => const Center(child: Text('Bem-vindo!')),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(message),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      final bloc = context.read<NasStatusBloc>();
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SettingsPage()),
                      );
                      bloc.add(const RefreshRequested());
                    },
                    child: const Text('Ir para Configurações'),
                  ),
                ],
              ),
            ),
            loaded: (services) => RefreshIndicator(
              onRefresh: () async {
                context.read<NasStatusBloc>().add(const RefreshRequested());
              },
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
                  return _buildServiceCard(context, service);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, dynamic service) {
    IconData icon;
    Color color;

    switch (service.name) {
      case 'Jellyfin':
        icon = Icons.movie;
        color = Colors.orange;
        break;
      case 'Jellyseerr':
        icon = Icons.request_page;
        color = Colors.purple;
        break;
      case 'Navidrome':
        icon = Icons.music_note;
        color = Colors.blue;
        break;
      case 'AdGuard Home':
        icon = Icons.security;
        color = Colors.green;
        break;
      case 'Nginx Proxy Manager':
        icon = Icons.router;
        color = Colors.teal;
        break;
      case 'Vaultwarden':
        icon = Icons.lock;
        color = Colors.red;
        break;
      case 'qBittorrent':
        icon = Icons.download;
        color = Colors.blueGrey;
        break;
      case 'Radarr':
        icon = Icons.movie_filter;
        color = Colors.yellow;
        break;
      case 'Sonarr':
        icon = Icons.tv;
        color = Colors.lightBlue;
        break;
      case 'Prowlarr':
        icon = Icons.search_sharp;
        color = Colors.redAccent;
        break;
      case 'Bazarr':
        icon = Icons.subtitles;
        color = Colors.amber;
        break;
      case 'Tdarr':
        icon = Icons.video_settings;
        color = Colors.deepOrange;
        break;
      default:
        icon = Icons.miscellaneous_services;
        color = Colors.grey;
    }

    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          if (service.name == 'Jellyseerr') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MediaPage()),
            );
          } else if (service.name == 'Navidrome') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MusicPage()),
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 8),
            Text(
              service.name,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 4,
                  backgroundColor: service.isOnline ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 4),
                Text(
                  service.isOnline ? 'Online' : 'Offline',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
