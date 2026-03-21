import '../../domain/entities/music.dart';
import '../../domain/repositories/music_repository.dart';

class GetArtistsUseCase {
  final MusicRepository repository;
  GetArtistsUseCase(this.repository);
  Future<List<Artist>> execute() => repository.getArtists();
}

class GetAlbumsUseCase {
  final MusicRepository repository;
  GetAlbumsUseCase(this.repository);
  Future<List<Album>> execute(String artistId) => repository.getAlbums(artistId);
}
