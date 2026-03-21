import '../entities/media.dart';
import '../repositories/jellyseerr_repository.dart';

class SearchMediaUseCase {
  final JellyseerrRepository repository;
  SearchMediaUseCase(this.repository);
  Future<List<Media>> execute(String query) => repository.search(query);
}

class GetTrendingMediaUseCase {
  final JellyseerrRepository repository;
  GetTrendingMediaUseCase(this.repository);
  Future<List<Media>> execute() => repository.getTrending();
}

class RequestMediaUseCase {
  final JellyseerrRepository repository;
  RequestMediaUseCase(this.repository);
  Future<void> execute(int mediaId, String mediaType) =>
      repository.requestMedia(mediaId, mediaType);
}
