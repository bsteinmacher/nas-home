import 'package:dio/dio.dart';
import '../../domain/entities/music.dart';

abstract class MusicDataSource {
  Future<List<Artist>> searchArtists(String query);
  Future<void> requestArtist(Artist artist);
  Future<List<Album>> getAlbums(String artistId);
}

class LidarrDataSourceImpl implements MusicDataSource {
  final Dio dio;
  final String baseUrl;
  final String apiKey;

  LidarrDataSourceImpl({
    required this.dio,
    required this.baseUrl,
    required this.apiKey,
  });

  @override
  Future<List<Artist>> searchArtists(String query) async {
    final response = await dio.get(
      '$baseUrl:8686/api/v1/artist/lookup',
      queryParameters: {'term': query},
      options: Options(headers: {'X-Api-Key': apiKey}),
    );

    final results = response.data as List;
    return results.map((e) => _mapToArtist(e)).toList();
  }

  @override
  Future<void> requestArtist(Artist artist) async {
    // Para adicionar ao Lidarr, precisamos do rootFolderPath e qualityProfileId
    // Usando valores padrão comuns para NAS
    await dio.post(
      '$baseUrl:8686/api/v1/artist',
      data: {
        'artistName': artist.artistName,
        'foreignArtistId': artist.mbid,
        'rootFolderPath': '/music', // Mapeamento padrão dentro do container Docker
        'qualityProfileId': 1, // Geralmente 'Any' ou 'Standard'
        'monitored': true,
        'addOptions': {'searchForMissingAlbums': true},
      },
      options: Options(headers: {'X-Api-Key': apiKey}),
    );
  }

  @override
  Future<List<Album>> getAlbums(String artistId) async {
    final response = await dio.get(
      '$baseUrl:8686/api/v1/album',
      queryParameters: {'artistId': artistId},
      options: Options(headers: {'X-Api-Key': apiKey}),
    );

    final results = response.data as List;
    return results.map((e) => _mapToAlbum(e)).toList();
  }

  Artist _mapToArtist(Map<String, dynamic> json) {
    final images = json['images'] as List?;
    final poster = images?.firstWhere(
      (img) => img['coverType'] == 'poster',
      orElse: () => images.isNotEmpty == true ? images.first : null,
    );

    return Artist(
      id: json['id']?.toString(),
      artistName: json['artistName'] ?? 'Unknown Artist',
      mbid: json['foreignArtistId'],
      status: json['status'],
      monitored: json['monitored'] ?? false,
      isAdded: json['id'] != null,
      remotePoster: poster?['remoteUrl'],
    );
  }

  Album _mapToAlbum(Map<String, dynamic> json) {
    final images = json['images'] as List?;
    final cover = images?.firstWhere(
      (img) => img['coverType'] == 'cover',
      orElse: () => images.isNotEmpty == true ? images.first : null,
    );

    return Album(
      id: json['id']?.toString(),
      title: json['title'] ?? 'Unknown Album',
      artistName: '', // Lidarr doesn't always include this in album list
      releaseDate: json['releaseDate'],
      remoteCover: cover?['remoteUrl'],
      monitored: json['monitored'] ?? false,
    );
  }
}
