import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../seerr/seerr_page.dart';
import '../../lidarr/lidarr_page.dart';
import '../../radarr/radarr_page.dart';
import '../../sonarr/sonarr_page.dart';
import '../../prowlarr/prowlarr_page.dart';
import '../../qbittorrent/qbittorrent_page.dart';
import '../../immich/immich_page.dart';
import '../../adguard/adguard_page.dart';
import '../../vaultwarden/vaultwarden_page.dart';
import '../../nextcloud/nextcloud_page.dart';
import '../../navidrome/navidrome_page.dart';
import '../../jellyfin/jellyfin_page.dart';
import '../../bazarr/bazarr_page.dart';
import '../../tdarr/tdarr_page.dart';
import '../../nginx/nginx_page.dart';
import '../../registry/registry_page.dart';
import '../../forgejo/forgejo_page.dart';
import '../../autobrr/autobrr_page.dart';
import '../../flaresolverr/flaresolverr_page.dart';
import '../../headscale/headscale_page.dart';

class ActiveServicesList extends StatelessWidget {
  final List<dynamic> services;

  const ActiveServicesList({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    // Ordenar por nome para consistência
    final sortedServices = List<dynamic>.from(services)
      ..sort((a, b) => a.name.compareTo(b.name));

    return Column(
      children: sortedServices.map((service) => _buildActiveServiceCard(context, service)).toList(),
    );
  }

  Widget _buildActiveServiceCard(BuildContext context, dynamic service) {
    IconData icon;
    Color color;
    String subLabel;

    switch (service.name) {
      case 'Nginx Proxy Manager':
        icon = Icons.lan_outlined;
        color = AppColors.networking;
        subLabel = 'PROXY_&_SSL_GATEWAY';
        break;
      case 'AdGuard Home':
        icon = Icons.security_outlined;
        color = AppColors.adguard;
        subLabel = 'DNS_SINKHOLE_&_ADBLOCK';
        break;
      case 'Vaultwarden':
        icon = Icons.vpn_key_outlined;
        color = AppColors.security;
        subLabel = 'PASSWORD_VAULT_MANAGER';
        break;
      case 'Jellyfin':
        icon = Icons.play_circle_outline;
        color = AppColors.jellyfin;
        subLabel = 'MEDIA_STREAMING_SERVER';
        break;
      case 'Seerr':
        icon = Icons.movie_outlined;
        color = AppColors.seerr;
        subLabel = 'SEARCH_&_REQUEST_MEDIA';
        break;
      case 'Navidrome':
        icon = Icons.music_note_outlined;
        color = AppColors.lidarr;
        subLabel = 'HI-FI_MUSIC_STREAMING';
        break;
      case 'qBittorrent':
        icon = Icons.download_for_offline_outlined;
        color = AppColors.download;
        subLabel = 'BITTORRENT_CLIENT';
        break;
      case 'Radarr':
        icon = Icons.local_movies_outlined;
        color = AppColors.radarr;
        subLabel = 'MOVIE_COLLECTION_AUTOMATION';
        break;
      case 'Sonarr':
        icon = Icons.tv_outlined;
        color = AppColors.sonarr;
        subLabel = 'TV_SHOWS_AUTOMATION';
        break;
      case 'Prowlarr':
        icon = Icons.search_outlined;
        color = AppColors.prowlarr;
        subLabel = 'INDEXER_MANAGER_&_PROXY';
        break;
      case 'Bazarr':
        icon = Icons.subtitles_outlined;
        color = AppColors.automation;
        subLabel = 'SUBTITLE_MANAGEMENT';
        break;
      case 'Tdarr':
        icon = Icons.compress_outlined;
        color = AppColors.optimization;
        subLabel = 'DISTRIBUTED_TRANSCODING';
        break;
      case 'Immich':
        icon = Icons.photo_library_outlined;
        color = AppColors.photos;
        subLabel = 'SELF-HOSTED_PHOTO_BACKUP';
        break;
      case 'Forgejo':
        icon = Icons.code_outlined;
        color = AppColors.git;
        subLabel = 'SELF-HOSTED_GIT_REPOS';
        break;
      case 'Autobrr':
        icon = Icons.auto_fix_high_outlined;
        color = AppColors.automationAlt;
        subLabel = 'AUTOMATED_TORRENT_GRABBER';
        break;
      case 'FlareSolverr':
        icon = Icons.router_outlined;
        color = AppColors.flaresolverr;
        subLabel = 'CHALLENGE_SOLVER_PROXY';
        break;
      case 'Headscale':
        icon = Icons.vpn_lock_outlined;
        color = AppColors.networking;
        subLabel = 'TAILSCALE_CONTROL_PLANE';
        break;
      case 'Nextcloud':
        icon = Icons.folder_shared_outlined;
        color = AppColors.files;
        subLabel = 'FILE_CLOUD_&_COLLABORATION';
        break;
      case 'Nas Registry':
        icon = Icons.api_outlined;
        color = AppColors.terminalGreen;
        subLabel = 'API_DISCOVERY_SERVICES';
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
          Widget page;
          switch (service.name) {
            case 'Seerr':
              page = const SeerrPage();
              break;
            case 'Lidarr':
              page = const LidarrPage();
              break;
            case 'Navidrome':
              page = const NavidromePage();
              break;
            case 'Jellyfin':
              page = const JellyfinPage();
              break;
            case 'Radarr':
              page = const RadarrPage();
              break;
            case 'Sonarr':
              page = const SonarrPage();
              break;
            case 'Prowlarr':
              page = const ProwlarrPage();
              break;
            case 'qBittorrent':
              page = const QbittorrentPage();
              break;
            case 'Immich':
              page = const ImmichPage();
              break;
            case 'AdGuard Home':
              page = const AdGuardPage();
              break;
            case 'Vaultwarden':
              page = const VaultwardenPage();
              break;
            case 'Nextcloud':
              page = const NextcloudPage();
              break;
            case 'Bazarr':
              page = const BazarrPage();
              break;
            case 'Tdarr':
              page = const TdarrPage();
              break;
            case 'Nginx Proxy Manager':
              page = const NginxProxyPage();
              break;
            case 'Nas Registry':
              page = const NasRegistryPage();
              break;
            case 'Forgejo':
              page = const ForgejoPage();
              break;
            case 'Autobrr':
              page = const AutobrrPage();
              break;
            case 'FlareSolverr':
              page = const FlareSolverrPage();
              break;
            case 'Headscale':
              page = const HeadscalePage();
              break;
            default:
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Module ${service.name} management coming soon.')),
              );
              return;
          }
          Navigator.push(context, MaterialPageRoute(builder: (context) => page));
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
                      service.name.toUpperCase(),
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
                      service.isOnline ? 'READY' : 'OFFLINE',
                      style: AppTypography.statusBadge.copyWith(
                        color: service.isOnline ? color : Colors.redAccent,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Icon(
                      Icons.chevron_right,
                      color: service.isOnline ? color : Colors.redAccent,
                      size: 12,
                    ),
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
