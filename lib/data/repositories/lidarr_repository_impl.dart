import '../../domain/entities/lidarr.dart';
import '../../domain/repositories/lidarr_repository.dart';
import '../datasources/lidarr_datasource.dart';

class LidarrRepositoryImpl implements LidarrRepository {
  final LidarrDataSource dataSource;

  LidarrRepositoryImpl(this.dataSource);

  @override
  Future<List<LidarrArtist>> searchArtists(String query) => dataSource.searchArtists(query);

  @override
  Future<void> requestArtist(LidarrArtist artist) => dataSource.requestArtist(artist);

  @override
  Future<List<LidarrAlbum>> getAlbums(String artistId) => dataSource.getAlbums(artistId);
}
