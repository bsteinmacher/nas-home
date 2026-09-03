import '../entities/lidarr.dart';
import '../repositories/lidarr_repository.dart';

class SearchArtistsUseCase {
  final LidarrRepository repository;

  SearchArtistsUseCase(this.repository);

  Future<List<LidarrArtist>> execute(String query) => repository.searchArtists(query);
}

class GetLibraryArtistsUseCase {
  final LidarrRepository repository;

  GetLibraryArtistsUseCase(this.repository);

  Future<List<LidarrArtist>> execute() => repository.getLibraryArtists();
}

class RequestArtistUseCase {
  final LidarrRepository repository;

  RequestArtistUseCase(this.repository);

  Future<LidarrArtist> execute(LidarrArtist artist) => repository.requestArtist(artist);
}

class GetAlbumsUseCase {
  final LidarrRepository repository;

  GetAlbumsUseCase(this.repository);

  Future<List<LidarrAlbum>> execute(String artistId) => repository.getAlbums(artistId);
}

class LookupAlbumsUseCase {
  final LidarrRepository repository;

  LookupAlbumsUseCase(this.repository);

  Future<List<LidarrAlbum>> execute(String artistMbid, String artistName) =>
      repository.lookupAlbums(artistMbid, artistName);
}

class GetTracksUseCase {
  final LidarrRepository repository;

  GetTracksUseCase(this.repository);

  Future<List<LidarrTrack>> execute(String albumId, {bool isQueued = false}) =>
      repository.getTracks(albumId, isQueued: isQueued);
}

class SearchAlbumUseCase {
  final LidarrRepository repository;

  SearchAlbumUseCase(this.repository);

  Future<void> execute(String albumId) => repository.searchAlbum(albumId);
}

class SearchArtistDiscographyUseCase {
  final LidarrRepository repository;

  SearchArtistDiscographyUseCase(this.repository);

  Future<void> execute(String artistId) => repository.searchArtistDiscography(artistId);
}
