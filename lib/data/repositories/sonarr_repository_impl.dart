import '../../domain/entities/sonarr.dart';
import '../../domain/repositories/sonarr_repository.dart';
import '../datasources/sonarr_datasource.dart';

class SonarrRepositoryImpl implements SonarrRepository {
  final SonarrDataSource dataSource;

  SonarrRepositoryImpl(this.dataSource);

  @override
  Future<List<SonarrSeries>> getSeries() {
    return dataSource.getSeries();
  }

  @override
  Future<List<dynamic>> getQueue() {
    return dataSource.getQueue();
  }
}
