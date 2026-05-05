import '../entities/seerr.dart';
import '../repositories/seerr_repository.dart';

class SearchSeerrUseCase {
  final SeerrRepository repository;
  SearchSeerrUseCase(this.repository);
  Future<List<Seerr>> execute(String query) => repository.search(query);
}

class GetTrendingSeerrUseCase {
  final SeerrRepository repository;
  GetTrendingSeerrUseCase(this.repository);
  Future<List<Seerr>> execute() => repository.getTrending();
}

class GetSeerrDetailsUseCase {
  final SeerrRepository repository;
  GetSeerrDetailsUseCase(this.repository);
  Future<Seerr> execute(int mediaId, String mediaType) =>
      repository.getDetails(mediaId, mediaType);
}

class RequestSeerrUseCase {
  final SeerrRepository repository;
  RequestSeerrUseCase(this.repository);
  Future<void> execute(int mediaId, String mediaType, {List<int>? seasons}) =>
      repository.requestMedia(mediaId, mediaType, seasons: seasons);
}
