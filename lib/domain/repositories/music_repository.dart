import '../../domain/entities/music.dart';

abstract class MusicRepository {
  Future<List<Artist>> getArtists();
  Future<List<Album>> getAlbums(String artistId);
}
