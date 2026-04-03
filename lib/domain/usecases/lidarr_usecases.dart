import '../entities/lidarr.dart';
import '../repositories/lidarr_repository.dart';

class SearchArtistsUseCase {
  final LidarrRepository repository;

  SearchArtistsUseCase(this.repository);

  Future<List<LidarrArtist>> execute(String query) {
    return repository.searchArtists(query);
  }
}

class RequestArtistUseCase {
  final LidarrRepository repository;

  RequestArtistUseCase(this.repository);

  Future<void> execute(LidarrArtist artist) {
    return repository.requestArtist(artist);
  }
}

class GetAlbumsUseCase {
  final LidarrRepository repository;

  GetAlbumsUseCase(this.repository);

  Future<List<LidarrAlbum>> execute(String artistId) {
    return repository.getAlbums(artistId);
  }
}
