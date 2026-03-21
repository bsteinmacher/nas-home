import 'package:dio/dio.dart';
import '../../domain/entities/nas_service.dart';
import '../../domain/repositories/nas_repository.dart';

class NasRepositoryImpl implements NasRepository {
  final Dio dio;

  NasRepositoryImpl(this.dio);

  @override
  Future<List<NasService>> getServices() async {
    return [
      const NasService(name: 'Nginx Proxy Manager', port: '81', description: 'Proxy & SSL Manager'),
      const NasService(name: 'AdGuard Home', port: '3000', description: 'DNS Sinkhole'),
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
    ];
  }

  @override
  Future<bool> checkServiceStatus(String baseUrl, String port) async {
    try {
      final response = await dio.get('$baseUrl:$port', options: Options(
        validateStatus: (status) => true,
        sendTimeout: const Duration(seconds: 2),
        receiveTimeout: const Duration(seconds: 2),
      ));
      return response.statusCode != null;
    } catch (e) {
      return false;
    }
  }
}
