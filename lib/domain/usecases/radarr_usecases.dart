import '../entities/radarr.dart';
import '../repositories/radarr_repository.dart';

class GetRadarrMoviesUseCase {
  final RadarrRepository repository;

  GetRadarrMoviesUseCase(this.repository);

  Future<List<RadarrMovie>> execute() {
    return repository.getMovies();
  }
}

class GetRadarrQueueUseCase {
  final RadarrRepository repository;

  GetRadarrQueueUseCase(this.repository);

  Future<List<dynamic>> execute() {
    return repository.getQueue();
  }
}
