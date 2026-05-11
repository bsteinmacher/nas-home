import 'package:dio/dio.dart';
import '../../domain/entities/nas_service.dart';
import '../../domain/entities/hardware_info.dart';
import '../../domain/repositories/nas_repository.dart';
import '../datasources/registry_datasource.dart';

class NasRepositoryImpl implements NasRepository {
  final Dio dio;
  final RegistryDataSource registryDataSource;

  NasRepositoryImpl(this.dio, this.registryDataSource);

  @override
  Future<List<NasService>> getServices() async {
    return _getBaseServices();
  }

  List<NasService> _getBaseServices() {
    return [
      const NasService(name: 'Nginx Proxy Manager', port: '81', description: 'Proxy & SSL Manager'),
      const NasService(name: 'AdGuard Home', port: '8085', description: 'DNS Sinkhole'),
      const NasService(name: 'Vaultwarden', port: '80', description: 'Passwords'),
      const NasService(name: 'Jellyfin', port: '8096', description: 'Media Server'),
      const NasService(name: 'Seerr', port: '5055', description: 'Media Requests'),
      const NasService(name: 'Navidrome', port: '4533', description: 'Music Server'),
      const NasService(name: 'Lidarr', port: '8686', description: 'Music Automation'),
      const NasService(name: 'qBittorrent', port: '8080', description: 'Torrent Client'),
      const NasService(name: 'Radarr', port: '7878', description: 'Movies Automation'),
      const NasService(name: 'Sonarr', port: '8989', description: 'TV Shows Automation'),
      const NasService(name: 'Prowlarr', port: '9696', description: 'Indexer Manager'),
      const NasService(name: 'Bazarr', port: '6767', description: 'Subtitles'),
      const NasService(name: 'Tdarr', port: '8265', description: 'Transcoding'),
      const NasService(name: 'Immich', port: '2283', description: 'Photos & Videos'),
      const NasService(name: 'Forgejo', port: '3001', description: 'Self-hosted Git'),
      const NasService(name: 'Autobrr', port: '7474', description: 'Download Automation'),
      const NasService(name: 'FlareSolverr', port: '8191', description: 'Proxy Solver'),
      const NasService(name: 'Headscale', port: '8080', description: 'VPN Control Plane'),
      const NasService(name: 'Nas Registry', port: '8000', description: 'API Discovery Service'),
    ];
  }

  @override
  Future<List<NasService>> getServicesWithUpdates(String baseUrl, String token, {bool force = false}) async {
    final services = _getBaseServices();
    final normalizedUrl = _normalizeUrl(baseUrl);
    try {
      final updates = await registryDataSource.getUpdates(normalizedUrl, token, force: force);
      print('DEBUG: [REGISTRY] Received ${updates.length} containers from backend');
      
      return services.map((service) {
        final cleanServiceName = service.name.toLowerCase().replaceAll(' ', '').replaceAll('-', '').replaceAll('_', '');
        
        Map<String, dynamic>? updateInfo;
        String? matchedContainer;

        for (var entry in updates.entries) {
          final containerName = entry.key.toLowerCase().replaceAll('-', '').replaceAll('_', '');
          
          if (containerName == cleanServiceName || 
              containerName.contains(cleanServiceName) || 
              cleanServiceName.contains(containerName)) {
            updateInfo = entry.value as Map<String, dynamic>;
            matchedContainer = entry.key;
            break;
          }
        }
        
        if (updateInfo != null && updateInfo.isNotEmpty) {
          final available = updateInfo['update_available'] == true;
          if (available) {
            print('DEBUG: [UPDATE_AVAIL] Service "${service.name}" -> Container "$matchedContainer"');
          }
          
          return service.copyWith(
            updateAvailable: available,
            containerName: matchedContainer,
            localDigest: updateInfo['local_digest'],
            remoteDigest: updateInfo['remote_digest'],
            localVersion: updateInfo['local_version'],
            remoteLastUpdated: updateInfo['remote_last_updated'],
            imageTag: updateInfo['image_tag'],
          );
        } else {
          return service;
        }
      }).toList();
    } catch (e) {
      print('Error getting services with updates: $e');
      return services;
    }
  }

  @override
  Future<void> updateService(String baseUrl, String token, String serviceName) async {
    // Tenta encontrar o serviço na lista atual para pegar o containerName real
    final services = await getServicesWithUpdates(baseUrl, token, force: false);
    final service = services.firstWhere(
      (s) => s.name == serviceName,
      orElse: () => NasService(name: serviceName, port: '', description: ''),
    );

    final targetContainer = service.containerName ?? serviceName.toLowerCase().replaceAll(' ', '').replaceAll('-', '').replaceAll('_', '');
    final normalizedUrl = _normalizeUrl(baseUrl);
    
    print('DEBUG: [REPO] Initializing update for: $serviceName (Target Container: $targetContainer)');
    await registryDataSource.updateService(normalizedUrl, token, targetContainer);
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
        sendTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ));
      
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        
        final cpu = data['cpu'] as Map<String, dynamic>?;
        final mem = data['mem'] as Map<String, dynamic>?;
        final sys = data['system'] as Map<String, dynamic>?;
        final fsList = data['fs'] as List<dynamic>? ?? [];
        final netList = data['network'] as List<dynamic>? ?? [];
        final sensors = data['sensors'] as List<dynamic>? ?? [];

        final rootFs = fsList.firstWhere(
          (f) => f['mnt_point'] == '/', 
          orElse: () => {'used': 0, 'size': 1},
        );

        final dataFs = fsList.firstWhere(
          (f) => f['mnt_point']?.toString().contains('data') ?? false,
          orElse: () => {'used': 0, 'size': 1},
        );

        double down = 0;
        double up = 0;
        if (netList.isNotEmpty) {
          final eth = netList.firstWhere(
            (n) => n['interface_name'] == 'enp2s0',
            orElse: () => netList.first,
          );
          down = (eth['bytes_recv_rate_per_sec'] as num? ?? 0).toDouble();
          up = (eth['bytes_sent_rate_per_sec'] as num? ?? 0).toDouble();
        }

        double temp = 0;
        if (sensors.isNotEmpty) {
          final cpuTemp = sensors.firstWhere(
            (s) => s['label']?.toString().contains('Package') ?? false,
            orElse: () => sensors.first,
          );
          temp = (cpuTemp['value'] as num? ?? 0).toDouble();
        }

        return HardwareInfo(
          hostname: sys?['hostname']?.toString() ?? 'unknown',
          cpuUsage: (cpu?['total'] as num? ?? 0).toDouble(),
          ramUsed: (mem?['used'] as num? ?? 0).toDouble(),
          ramTotal: (mem?['total'] as num? ?? 0).toDouble(),
          uptime: data['uptime']?.toString() ?? '0:00',
          temperature: temp,
          downloadSpeed: down,
          uploadSpeed: up,
          ssdUsed: (rootFs['used'] as num? ?? 0).toDouble(),
          ssdTotal: (rootFs['size'] as num? ?? 1).toDouble(),
          hddUsed: (dataFs['used'] as num? ?? 0).toDouble(),
          hddTotal: (dataFs['size'] as num? ?? 1).toDouble(),
        );
      } else {
        throw Exception('Failed to load hardware info: ${response.statusCode}');
      }
    } catch (e) {
      print('Error parsing hardware info: $e');
      throw Exception('Error parsing hardware info: $e');
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
