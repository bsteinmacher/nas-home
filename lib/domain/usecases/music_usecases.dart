import '../../domain/entities/music.dart';
import '../../domain/repositories/music_repository.dart';

class SearchArtistsUseCase {
  final MusicRepository repository;

  SearchArtistsUseCase(this.repository);

  Future<List<Artist>> execute(String query) {
    return repository.searchArtists(query);
  }
}

class RequestArtistUseCase {
  final MusicRepository repository;

  RequestArtistUseCase(this.repository);

  Future<void> execute(Artist artist) {
    return repository.requestArtist(artist);
  }
}

class GetAlbumsUseCase {
  final MusicRepository repository;

  GetAlbumsUseCase(this.repository);

  Future<List<Album>> execute(String artistId) {
    return repository.getAlbums(artistId);
  }
}
