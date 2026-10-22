import '../../domain/entities/lidarr.dart';
import '../../domain/repositories/lidarr_repository.dart';
import '../datasources/lidarr_datasource.dart';

class LidarrRepositoryImpl implements LidarrRepository {
  final LidarrDataSource dataSource;

  LidarrRepositoryImpl(this.dataSource);

  @override
  Future<List<LidarrArtist>> searchArtists(String query) =>
      dataSource.searchArtists(query);

  @override
  Future<List<LidarrArtist>> getLibraryArtists() =>
      dataSource.getLibraryArtists();

  @override
  Future<LidarrArtist> requestArtist(LidarrArtist artist) =>
      dataSource.requestArtist(artist);

  @override
  Future<List<LidarrAlbum>> getAlbums(String artistId) =>
      dataSource.getAlbums(artistId);

  @override
  Future<LidarrAlbum> getAlbum(String albumId) => dataSource.getAlbum(albumId);

  @override
  Future<List<LidarrAlbum>> lookupAlbums(
    String artistMbid,
    String artistName,
  ) => dataSource.lookupAlbums(artistMbid, artistName);

  @override
  Future<List<LidarrTrack>> getTracks(
    String albumId, {
    bool isQueued = false,
  }) => dataSource.getTracks(albumId, isQueued: isQueued);

  @override
  Future<LidarrCommand> searchAlbum(String albumId) =>
      dataSource.searchAlbum(albumId);

  @override
  Future<LidarrCommand> searchArtistDiscography(String artistId) =>
      dataSource.searchArtistDiscography(artistId);

  @override
  Future<LidarrCommand> getCommandStatus(String commandId) =>
      dataSource.getCommandStatus(commandId);
}
