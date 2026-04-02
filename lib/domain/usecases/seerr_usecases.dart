import '../entities/media.dart';
import '../repositories/seerr_repository.dart';

class SearchMediaUseCase {
  final SeerrRepository repository;
  SearchMediaUseCase(this.repository);
  Future<List<Media>> execute(String query) => repository.search(query);
}

class GetTrendingMediaUseCase {
  final SeerrRepository repository;
  GetTrendingMediaUseCase(this.repository);
  Future<List<Media>> execute() => repository.getTrending();
}

class RequestMediaUseCase {
  final SeerrRepository repository;
  RequestMediaUseCase(this.repository);
  Future<void> execute(int mediaId, String mediaType) =>
      repository.requestMedia(mediaId, mediaType);
}
