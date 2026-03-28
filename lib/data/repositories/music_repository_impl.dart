import '../../domain/entities/music.dart';
import '../../domain/repositories/music_repository.dart';
import '../datasources/music_datasource.dart';

class MusicRepositoryImpl implements MusicRepository {
  final MusicDataSource dataSource;

  MusicRepositoryImpl(this.dataSource);

  @override
  Future<List<Artist>> searchArtists(String query) => dataSource.searchArtists(query);

  @override
  Future<void> requestArtist(Artist artist) => dataSource.requestArtist(artist);

  @override
  Future<List<Album>> getAlbums(String artistId) => dataSource.getAlbums(artistId);
}
