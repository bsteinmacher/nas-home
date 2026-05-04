import '../entities/prowlarr.dart';

abstract class ProwlarrRepository {
  Future<List<ProwlarrIndexer>> getIndexers();
}
