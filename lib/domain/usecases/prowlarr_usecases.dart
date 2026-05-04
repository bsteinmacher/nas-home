import '../entities/prowlarr.dart';
import '../repositories/prowlarr_repository.dart';

class GetProwlarrIndexersUseCase {
  final ProwlarrRepository repository;

  GetProwlarrIndexersUseCase(this.repository);

  Future<List<ProwlarrIndexer>> execute() async {
    return await repository.getIndexers();
  }
}
