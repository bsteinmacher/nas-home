import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import 'pages/lidarr/lidarr_page.dart';
import 'pages/seerr/seerr_page.dart';
import 'pages/syncthing/syncthing_page.dart';

class ServiceMeta {
  final String name;
  final String label;
  final String description;
  final IconData icon;
  final Color color;
  final WidgetBuilder? page;

  const ServiceMeta({
    required this.name,
    required this.label,
    required this.description,
    required this.icon,
    required this.color,
    this.page,
  });

  bool get hasModule => page != null;
}

/// Services that have a real screen in the app, alphabetical by card label.
const moduleOrder = ['Lidarr', 'Syncthing', 'Seerr'];

final Map<String, ServiceMeta> serviceCatalog = {
  'Nginx Proxy Manager': ServiceMeta(
    name: 'Nginx Proxy Manager',
    label: 'NGINX_PROXY_MANAGER',
    description: 'PROXY_&_SSL_GATEWAY',
    icon: Icons.lan_outlined,
    color: AppColors.networking,
  ),
  'AdGuard Home': ServiceMeta(
    name: 'AdGuard Home',
    label: 'ADGUARD_HOME',
    description: 'DNS_SINKHOLE_&_ADBLOCK',
    icon: Icons.security_outlined,
    color: AppColors.adguard,
  ),
  'Vaultwarden': ServiceMeta(
    name: 'Vaultwarden',
    label: 'VAULTWARDEN',
    description: 'PASSWORD_VAULT_MANAGER',
    icon: Icons.vpn_key_outlined,
    color: AppColors.security,
  ),
  'Jellyfin': ServiceMeta(
    name: 'Jellyfin',
    label: 'JELLYFIN',
    description: 'MEDIA_STREAMING_SERVER',
    icon: Icons.play_circle_outline,
    color: AppColors.jellyfin,
  ),
  'Seerr': ServiceMeta(
    name: 'Seerr',
    label: 'SEERR',
    description: 'MOVIE_&_TV_REQUESTS',
    icon: Icons.movie_outlined,
    color: AppColors.seerr,
    page: (_) => const SeerrPage(),
  ),
  'Navidrome': ServiceMeta(
    name: 'Navidrome',
    label: 'NAVIDROME',
    description: 'HI-FI_MUSIC_STREAMING',
    icon: Icons.music_note_outlined,
    color: AppColors.lidarr,
  ),
  'qBittorrent': ServiceMeta(
    name: 'qBittorrent',
    label: 'QBITTORRENT',
    description: 'BITTORRENT_CLIENT',
    icon: Icons.download_for_offline_outlined,
    color: AppColors.download,
  ),
  'Radarr': ServiceMeta(
    name: 'Radarr',
    label: 'RADARR',
    description: 'MOVIE_COLLECTION_AUTOMATION',
    icon: Icons.local_movies_outlined,
    color: AppColors.radarr,
  ),
  'Sonarr': ServiceMeta(
    name: 'Sonarr',
    label: 'SONARR',
    description: 'TV_SHOWS_AUTOMATION',
    icon: Icons.tv_outlined,
    color: AppColors.sonarr,
  ),
  'Prowlarr': ServiceMeta(
    name: 'Prowlarr',
    label: 'PROWLARR',
    description: 'INDEXER_MANAGER_&_PROXY',
    icon: Icons.search_outlined,
    color: AppColors.prowlarr,
  ),
  'Bazarr': ServiceMeta(
    name: 'Bazarr',
    label: 'BAZARR',
    description: 'SUBTITLE_MANAGEMENT',
    icon: Icons.subtitles_outlined,
    color: AppColors.automation,
  ),
  'Tdarr': ServiceMeta(
    name: 'Tdarr',
    label: 'TDARR',
    description: 'DISTRIBUTED_TRANSCODING',
    icon: Icons.compress_outlined,
    color: AppColors.optimization,
  ),
  'Immich': ServiceMeta(
    name: 'Immich',
    label: 'IMMICH',
    description: 'SELF-HOSTED_PHOTO_BACKUP',
    icon: Icons.photo_library_outlined,
    color: AppColors.photos,
  ),
  'Forgejo': ServiceMeta(
    name: 'Forgejo',
    label: 'FORGEJO',
    description: 'SELF-HOSTED_GIT_REPOS',
    icon: Icons.code_outlined,
    color: AppColors.git,
  ),
  'Syncthing': ServiceMeta(
    name: 'Syncthing',
    label: 'MUSIC_DL',
    description: 'MUSIC_DOWNLOADER',
    icon: Icons.library_music_outlined,
    color: AppColors.syncthing,
    page: (_) => const SyncthingPage(),
  ),
  'Lidarr': ServiceMeta(
    name: 'Lidarr',
    label: 'LIDARR',
    description: 'MUSIC_AUTOMATION',
    icon: Icons.album_outlined,
    color: AppColors.lidarr,
    page: (_) => const LidarrPage(),
  ),
  'Autobrr': ServiceMeta(
    name: 'Autobrr',
    label: 'AUTOBRR',
    description: 'AUTOMATED_TORRENT_GRABBER',
    icon: Icons.auto_fix_high_outlined,
    color: AppColors.automationAlt,
  ),
  'FlareSolverr': ServiceMeta(
    name: 'FlareSolverr',
    label: 'FLARESOLVERR',
    description: 'CHALLENGE_SOLVER_PROXY',
    icon: Icons.router_outlined,
    color: AppColors.flaresolverr,
  ),
  'Headscale': ServiceMeta(
    name: 'Headscale',
    label: 'HEADSCALE',
    description: 'TAILSCALE_CONTROL_PLANE',
    icon: Icons.vpn_lock_outlined,
    color: AppColors.networking,
  ),
  'Nextcloud': ServiceMeta(
    name: 'Nextcloud',
    label: 'NEXTCLOUD',
    description: 'PLANNED_DEPLOYMENT',
    icon: Icons.folder_shared_outlined,
    color: AppColors.files,
  ),
  'Nas Registry': ServiceMeta(
    name: 'Nas Registry',
    label: 'NAS_REGISTRY',
    description: 'API_DISCOVERY_SERVICES',
    icon: Icons.api_outlined,
    color: AppColors.terminalGreen,
  ),
};

ServiceMeta serviceMetaFor(String name) {
  return serviceCatalog[name] ??
      ServiceMeta(
        name: name,
        label: name.replaceAll(' ', '_').toUpperCase(),
        description: 'ACTIVE_MODULE',
        icon: Icons.bolt,
        color: AppColors.terminalGreen,
      );
}
