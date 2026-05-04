import '../../domain/entities/radarr.dart';

abstract class RadarrRepository {
  Future<List<RadarrMovie>> getMovies();
  Future<List<dynamic>> getQueue();
}
