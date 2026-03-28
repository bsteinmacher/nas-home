import '../../domain/entities/music.dart';

abstract class MusicRepository {
  Future<List<Artist>> searchArtists(String query);
  Future<void> requestArtist(Artist artist);
  Future<List<Album>> getAlbums(String artistId);
}
