import 'package:dio/dio.dart';
import '../../domain/entities/hardware_info.dart';
import '../../domain/entities/nas_service.dart';
import '../../domain/repositories/nas_repository.dart';

class NasRepositoryImpl implements NasRepository {
  final Dio dio;

  NasRepositoryImpl(this.dio);

  @override
  Future<List<NasService>> getServices() async {
    return [
      const NasService(name: 'Nginx Proxy Manager', port: '81', description: 'Proxy & SSL Manager'),
      const NasService(name: 'AdGuard Home', port: '8085', description: 'DNS Sinkhole'),
      const NasService(name: 'Vaultwarden', port: '80', description: 'Passwords'),
      const NasService(name: 'Jellyfin', port: '8096', description: 'Media Server'),
      const NasService(name: 'Seerr', port: '5055', description: 'Media Requests'),
      const NasService(name: 'Navidrome', port: '4533', description: 'Music Server'),
      const NasService(name: 'qBittorrent', port: '8080', description: 'Torrent Client'),
      const NasService(name: 'Radarr', port: '7878', description: 'Movies Automation'),
      const NasService(name: 'Sonarr', port: '8989', description: 'TV Shows Automation'),
      const NasService(name: 'Prowlarr', port: '9696', description: 'Indexer Manager'),
      const NasService(name: 'Bazarr', port: '6767', description: 'Subtitles'),
      const NasService(name: 'Tdarr', port: '8265', description: 'Transcoding'),
      const NasService(name: 'Immich', port: '2283', description: 'Photos & Videos'),
      const NasService(name: 'Nextcloud', port: '8080', description: 'Files & Cloud'),
      const NasService(name: 'Nas Registry', port: '8000', description: 'API Discovery Service'),
    ];
  }

  @override
  Future<bool> checkServiceStatus(String baseUrl, String port) async {
    final normalizedUrl = _normalizeUrl(baseUrl);
    final url = '$normalizedUrl:$port';
    try {
      final response = await dio.get(
        url,
        options: Options(
          validateStatus: (status) => true,
          sendTimeout: const Duration(seconds: 2),
          receiveTimeout: const Duration(seconds: 2),
        ),
      );
      return response.statusCode != null;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<HardwareInfo> getHardwareInfo(String baseUrl) async {
    final normalizedUrl = _normalizeUrl(baseUrl);
    final apiUrl = '$normalizedUrl:61208/api/4/all';

    try {
      final response = await dio.get(apiUrl, options: Options(
        sendTimeout: const Duration(seconds: 3),
        receiveTimeout: const Duration(seconds: 3),
      ));
      final data = response.data;

      // Parse System Info
      final hostname = data['system']?['hostname']?.toString() ?? 'Unknown';
      final uptime = data['system']?['uptime']?.toString() ?? 'N/A';

      // Parse CPU
      final cpuUsage = (data['cpu']?['total'] as num?)?.toDouble() ?? 0.0;
      final temp = (data['sensors'] as List?)?.firstWhere(
            (s) => s['label']?.toString().toLowerCase().contains('package') ?? false,
            orElse: () => {'value': 0.0},
          )['value']?.toDouble() ?? 0.0;

      // Parse RAM
      final ramUsed = (data['mem']?['used'] as num?)?.toDouble() ?? 0.0;
      final ramTotal = (data['mem']?['total'] as num?)?.toDouble() ?? 0.0;

      // Parse Network
      final net = (data['network'] as List?)?.firstWhere(
            (n) => n['interface_name'] != 'lo',
            orElse: () => {'rx': 0.0, 'tx': 0.0},
          );
      final downloadSpeed = (net?['rx'] as num?)?.toDouble() ?? 0.0;
      final uploadSpeed = (net?['tx'] as num?)?.toDouble() ?? 0.0;

      // Parse Disk (Filesystem)
      final fs = data['fs'] as List?;
      final ssd = fs?.firstWhere(
            (f) => f['mnt_point'] == '/',
            orElse: () => {'used': 0.0, 'size': 0.0},
          );
      final hdd = fs?.firstWhere(
            (f) => f['mnt_point'] == '/mnt/storage' || f['mnt_point']?.toString().contains('media') == true,
            orElse: () => {'used': 0.0, 'size': 0.0},
          );

      final ssdUsed = (ssd?['used'] as num?)?.toDouble() ?? 0.0;
      final ssdTotal = (ssd?['size'] as num?)?.toDouble() ?? 0.0;
      final hddUsed = (hdd?['used'] as num?)?.toDouble() ?? 0.0;
      final hddTotal = (hdd?['size'] as num?)?.toDouble() ?? 0.0;

      return HardwareInfo(
        hostname: hostname,
        cpuUsage: cpuUsage,
        ramUsed: ramUsed,
        ramTotal: ramTotal,
        uptime: uptime,
        temperature: temp,
        downloadSpeed: downloadSpeed,
        uploadSpeed: uploadSpeed,
        ssdUsed: ssdUsed,
        ssdTotal: ssdTotal,
        hddUsed: hddUsed,
        hddTotal: hddTotal,
      );
    } catch (e) {
      return const HardwareInfo(
        hostname: 'OFFLINE',
        cpuUsage: 0,
        ramUsed: 0,
        ramTotal: 0,
        uptime: 'N/A',
        temperature: 0,
        downloadSpeed: 0,
        uploadSpeed: 0,
        ssdUsed: 0,
        ssdTotal: 0,
        hddUsed: 0,
        hddTotal: 0,
      );
    }
  }

  String _normalizeUrl(String url) {
    String normalized = url.trim();
    if (!normalized.startsWith('http')) {
      normalized = 'http://$normalized';
    }
    if (normalized.endsWith('/')) {
      normalized = normalized.substring(0, normalized.length - 1);
    }
    return normalized;
  }
}
