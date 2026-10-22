import '../entities/lidarr.dart';

abstract class LidarrRepository {
  Future<List<LidarrArtist>> searchArtists(String query);
  Future<List<LidarrArtist>> getLibraryArtists();
  Future<LidarrArtist> requestArtist(LidarrArtist artist);
  Future<List<LidarrAlbum>> getAlbums(String artistId);
  Future<LidarrAlbum> getAlbum(String albumId);
  Future<List<LidarrAlbum>> lookupAlbums(String artistMbid, String artistName);
  Future<List<LidarrTrack>> getTracks(String albumId, {bool isQueued = false});
  Future<LidarrCommand> searchAlbum(String albumId);
  Future<LidarrCommand> searchArtistDiscography(String artistId);
  Future<LidarrCommand> getCommandStatus(String commandId);
}
