import '../repositories/registry_repository.dart';

class SyncRegistryConfigUseCase {
  final RegistryRepository repository;

  SyncRegistryConfigUseCase(this.repository);

  Future<void> execute(String baseUrl, String token) async {
    return repository.syncConfig(baseUrl, token);
  }
}
