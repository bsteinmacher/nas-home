import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../pages/media_page.dart';
import '../pages/music_page.dart';

class ActiveServicesList extends StatelessWidget {
  final List<dynamic> services;

  const ActiveServicesList({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    final activeNames = ['Immich', 'Jellyseerr', 'Lidarr', 'Nextcloud', 'qBittorrent'];
    
    final activeServices = services
        .where((s) => activeNames.contains(s.name) || (s.name == 'Navidrome' && activeNames.contains('Lidarr')))
        .toList();
    
    activeServices.sort((a, b) {
      final nameA = a.name == 'Navidrome' ? 'Lidarr' : a.name;
      final nameB = b.name == 'Navidrome' ? 'Lidarr' : b.name;
      return activeNames.indexOf(nameA).compareTo(activeNames.indexOf(nameB));
    });

    return Column(
      children: activeServices.map((service) => _buildActiveServiceCard(context, service)).toList(),
    );
  }

  Widget _buildActiveServiceCard(BuildContext context, dynamic service) {
    IconData icon;
    Color color;
    String subLabel;

    final displayLabel = service.name == 'Navidrome' ? 'Lidarr' : service.name;

    switch (service.name) {
      case 'Jellyseerr':
        icon = Icons.movie_outlined;
        color = AppColors.media;
        subLabel = 'SEARCH_&_REQUEST_MEDIA';
        break;
      case 'Navidrome':
        icon = Icons.music_note_outlined;
        color = AppColors.music;
        subLabel = 'SEARCH_&_REQUEST_MUSIC';
        break;
      case 'qBittorrent':
        icon = Icons.download_for_offline_outlined;
        color = AppColors.download;
        subLabel = 'DOWNLOAD_MANAGER';
        break;
      case 'Immich':
        icon = Icons.photo_library_outlined;
        color = AppColors.photos;
        subLabel = 'PHOTO_&_VIDEO_GALLERY';
        break;
      case 'Nextcloud':
        icon = Icons.folder_shared_outlined;
        color = AppColors.files;
        subLabel = 'FILES_&_CLOUD_STORAGE';
        break;
      default:
        icon = Icons.bolt;
        color = AppColors.terminalGreen;
        subLabel = 'ACTIVE_MODULE';
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm + AppSpacing.xs),
      child: InkWell(
        onTap: () {
          if (service.name == 'Jellyseerr') {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MediaPage()));
          } else if (service.name == 'Navidrome') {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MusicPage()));
          }
        },
        child: Container(
          height: AppSpacing.cardHeight,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
            border: Border.all(color: color.withValues(alpha: 0.2)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Row(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      displayLabel.toUpperCase(),
                      style: AppTypography.moduleLabel,
                    ),
                    Text(
                      subLabel,
                      style: AppTypography.moduleSublabel,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: color.withValues(alpha: 0.3)),
                  borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
                ),
                child: Row(
                  children: [
                    Text(
                      'READY',
                      style: AppTypography.statusBadge.copyWith(color: color),
                    ),
                    const SizedBox(width: AppSpacing.xs),
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
