import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../pages/seerr_page.dart';
import '../pages/lidarr_page.dart';
import '../pages/radarr_page.dart';
import '../pages/sonarr_page.dart';

class NasServiceCard extends StatelessWidget {
  final dynamic service;

  const NasServiceCard({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color color;

    switch (service.name) {
      case 'Seerr':
        icon = Icons.movie_outlined;
        color = AppColors.seerr;
        break;
      case 'Navidrome':
      case 'Lidarr':
        icon = Icons.music_note_outlined;
        color = AppColors.lidarr;
        break;
      case 'Radarr':
        icon = Icons.local_movies_outlined;
        color = AppColors.radarr;
        break;
      case 'Sonarr':
        icon = Icons.tv_outlined;
        color = AppColors.sonarr;
        break;
      case 'qBittorrent':
        icon = Icons.download_for_offline_outlined;
        color = AppColors.download;
        break;
      case 'Immich':
        icon = Icons.photo_library_outlined;
        color = AppColors.photos;
        break;
      case 'Nextcloud':
        icon = Icons.folder_shared_outlined;
        color = AppColors.files;
        break;
      case 'Nginx Proxy Manager':
        icon = Icons.swap_calls_outlined;
        color = Colors.blueGrey;
        break;
      case 'AdGuard Home':
        icon = Icons.shield_outlined;
        color = Colors.green;
        break;
      case 'Vaultwarden':
        icon = Icons.lock_outline;
        color = Colors.blue;
        break;
      case 'Prowlarr':
        icon = Icons.radar_outlined;
        color = Colors.orange;
        break;
      case 'Bazarr':
        icon = Icons.subtitles_outlined;
        color = Colors.purple;
        break;
      case 'Tdarr':
        icon = Icons.video_settings_outlined;
        color = Colors.teal;
        break;
      case 'Nas Registry':
        icon = Icons.api_outlined;
        color = AppColors.terminalGreen;
        break;
      default:
        icon = Icons.bolt;
        color = AppColors.terminalGreen;
    }

    final isOnline = service.isOnline;
    final cardColor = isOnline ? color : Colors.redAccent;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm + AppSpacing.xs),
      child: InkWell(
        onTap: () {
          if (service.name == 'Seerr') {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SeerrPage()));
          } else if (service.name == 'Navidrome' || service.name == 'Lidarr') {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LidarrPage()));
          } else if (service.name == 'Radarr') {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const RadarrPage()));
          } else if (service.name == 'Sonarr') {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SonarrPage()));
          }
        },
        child: Container(
          height: AppSpacing.cardHeight + 20,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
            border: Border.all(color: cardColor.withValues(alpha: 0.3), width: 1.5),
            boxShadow: [
              BoxShadow(
                color: cardColor.withValues(alpha: 0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Row(
            children: [
              Icon(icon, color: cardColor, size: 28),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.name.toUpperCase(),
                      style: AppTypography.moduleLabel.copyWith(
                        color: cardColor,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      service.description.toUpperCase(),
                      style: AppTypography.moduleSublabel.copyWith(fontSize: 10),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'PORT: ${service.port}',
                      style: AppTypography.moduleSublabel.copyWith(
                        fontSize: 9,
                        color: AppColors.textMuted,
                      ),
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
                  border: Border.all(color: cardColor.withValues(alpha: 0.4)),
                  borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
                  color: cardColor.withValues(alpha: 0.05),
                ),
                child: Row(
                  children: [
                    Text(
                      isOnline ? 'ONLINE' : 'OFFLINE',
                      style: AppTypography.statusBadge.copyWith(
                        color: cardColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (['Seerr', 'Navidrome', 'Lidarr', 'Radarr', 'Sonarr'].contains(service.name)) ...[
                      const SizedBox(width: AppSpacing.xs),
                      Icon(Icons.chevron_right, color: cardColor, size: 12),
                    ],
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
