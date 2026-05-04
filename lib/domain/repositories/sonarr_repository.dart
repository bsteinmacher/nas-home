import '../../domain/entities/sonarr.dart';

abstract class SonarrRepository {
  Future<List<SonarrSeries>> getSeries();
  Future<List<dynamic>> getQueue();
}
