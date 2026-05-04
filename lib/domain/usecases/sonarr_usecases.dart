import '../entities/sonarr.dart';
import '../repositories/sonarr_repository.dart';

class GetSonarrSeriesUseCase {
  final SonarrRepository repository;

  GetSonarrSeriesUseCase(this.repository);

  Future<List<SonarrSeries>> execute() {
    return repository.getSeries();
  }
}

class GetSonarrQueueUseCase {
  final SonarrRepository repository;

  GetSonarrQueueUseCase(this.repository);

  Future<List<dynamic>> execute() {
    return repository.getQueue();
  }
}
