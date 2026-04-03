import '../entities/lidarr.dart';

abstract class LidarrRepository {
  Future<List<LidarrArtist>> searchArtists(String query);
  Future<void> requestArtist(LidarrArtist artist);
  Future<List<LidarrAlbum>> getAlbums(String artistId);
}
