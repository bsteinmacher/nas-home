import 'package:dio/dio.dart';
import '../../domain/entities/nas_service.dart';
import '../../domain/entities/hardware_info.dart';
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
      const NasService(name: 'Jellyseerr', port: '5055', description: 'Media Requests'),
      const NasService(name: 'Navidrome', port: '4533', description: 'Music Server'),
      const NasService(name: 'qBittorrent', port: '8080', description: 'Torrent Client'),
      const NasService(name: 'Radarr', port: '7878', description: 'Movies Automation'),
      const NasService(name: 'Sonarr', port: '8989', description: 'TV Shows Automation'),
      const NasService(name: 'Prowlarr', port: '9696', description: 'Indexer Manager'),
      const NasService(name: 'Bazarr', port: '6767', description: 'Subtitles'),
      const NasService(name: 'Tdarr', port: '8265', description: 'Transcoding'),
      const NasService(name: 'Immich', port: '2283', description: 'Photos & Videos'),
      const NasService(name: 'Nextcloud', port: '8080', description: 'Files & Cloud'),
    ];
  }

  @override
  Future<bool> checkServiceStatus(String baseUrl, String port) async {
    final normalizedUrl = _normalizeUrl(baseUrl);
    try {
      final response = await dio.get('$normalizedUrl:$port', options: Options(
        validateStatus: (status) => true,
        sendTimeout: const Duration(seconds: 2),
        receiveTimeout: const Duration(seconds: 2),
      ));
      return response.statusCode != null;
    } catch (e) {
      print('Error checking service $port: $e');
      return false;
    }
  }

  @override
  Future<HardwareInfo> getHardwareInfo(String baseUrl) async {
    final normalizedUrl = _normalizeUrl(baseUrl);
    final apiUrl = '$normalizedUrl:61208/api/4/all';
    
    try {
      print('Fetching hardware info from: $apiUrl');
      final response = await dio.get(apiUrl, options: Options(
        sendTimeout: const Duration(seconds: 3),
        receiveTimeout: const Duration(seconds: 3),
      ));
      
      final data = response.data as Map<String, dynamic>;

      // Parsing CPU
      double cpuUsage = 0;
      if (data['cpu'] != null) {
        final cpu = data['cpu'] as Map<String, dynamic>;
        cpuUsage = (cpu['total'] as num?)?.toDouble() ?? 0;
      }

      // Parsing RAM
      double ramUsed = 0;
      double ramTotal = 0;
      if (data['mem'] != null) {
        final mem = data['mem'] as Map<String, dynamic>;
        ramUsed = ((mem['used'] as num?)?.toDouble() ?? 0) / (1024 * 1024 * 1024);
        ramTotal = ((mem['total'] as num?)?.toDouble() ?? 0) / (1024 * 1024 * 1024);
      }

      // Parsing Uptime
      final uptimeStr = data['uptime']?.toString() ?? 'N/A';

      // Parsing Temperature (sensors)
      double temp = 0;
      final sensors = data['sensors'] as List?;
      if (sensors != null && sensors.isNotEmpty) {
        try {
          final cpuTempSensor = sensors.firstWhere(
            (s) {
              final label = s['label']?.toString().toLowerCase() ?? '';
              return label.contains('cpu') || label.contains('package') || label.contains('temp1');
            },
            orElse: () => sensors.first,
          );
          temp = (cpuTempSensor['value'] as num?)?.toDouble() ?? 0;
        } catch (_) {}
      }

      // Hostname
      String hostname = 'UNKNOWN';
      if (data['system'] != null) {
        hostname = (data['system'] as Map<String, dynamic>)['hostname']?.toString().toUpperCase() ?? 'UNKNOWN';
      }

      return HardwareInfo(
        hostname: hostname,
        cpuUsage: cpuUsage,
        ramUsed: ramUsed,
        ramTotal: ramTotal,
        uptime: uptimeStr,
        temperature: temp,
      );
    } catch (e) {
      print('Error fetching hardware info from $apiUrl: $e');
      return const HardwareInfo(
        hostname: 'OFFLINE',
        cpuUsage: 0,
        ramUsed: 0,
        ramTotal: 0,
        uptime: 'N/A',
        temperature: 0,
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
