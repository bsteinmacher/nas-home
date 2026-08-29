import '../entities/nas_service.dart';
import '../repositories/nas_repository.dart';

class GetServicesStatusUseCase {
  final NasRepository repository;

  GetServicesStatusUseCase(this.repository);

  Future<List<NasService>> execute(String nasUrl, {String? registryToken, bool force = false}) async {
    List<NasService> services;
    if (registryToken != null && registryToken.isNotEmpty) {
      services = await repository.getServicesWithUpdates(nasUrl, registryToken, force: force);
    } else {
      services = await repository.getServices();
    }
    
    final updatedServices = <NasService>[];

    for (var service in services) {
      if (!service.isDeployed || service.port.isEmpty) {
        updatedServices.add(service.copyWith(isOnline: false));
        continue;
      }
      final isOnline = await repository.checkServiceStatus(nasUrl, service.port);
      updatedServices.add(service.copyWith(isOnline: isOnline));
    }

    return updatedServices;
  }
}
