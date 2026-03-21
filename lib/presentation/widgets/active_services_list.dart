import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/media_page.dart';
import '../pages/music_page.dart';

class ActiveServicesList extends StatelessWidget {
  final List<dynamic> services;

  const ActiveServicesList({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    final activeNames = ['Jellyseerr', 'Navidrome', 'qBittorrent', 'Immich', 'Nextcloud'];
    final activeServices = services.where((s) => activeNames.contains(s.name)).toList();

    return Column(
      children: activeServices.map((service) => _buildActiveServiceCard(context, service)).toList(),
    );
  }

  Widget _buildActiveServiceCard(BuildContext context, dynamic service) {
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
