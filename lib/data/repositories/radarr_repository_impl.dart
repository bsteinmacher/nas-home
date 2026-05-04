import '../../domain/entities/radarr.dart';
import '../../domain/repositories/radarr_repository.dart';
import '../datasources/radarr_datasource.dart';

class RadarrRepositoryImpl implements RadarrRepository {
  final RadarrDataSource dataSource;

  RadarrRepositoryImpl(this.dataSource);

  @override
  Future<List<RadarrMovie>> getMovies() {
    return dataSource.getMovies();
  }

  @override
  Future<List<dynamic>> getQueue() {
    return dataSource.getQueue();
  }
}
