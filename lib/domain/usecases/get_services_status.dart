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
      final hostHeader = _healthHostFor(service.name);
      final isOnline = await repository.checkServiceStatus(
        nasUrl,
        service.port,
        hostHeader: hostHeader,
      );
      updatedServices.add(service.copyWith(isOnline: isOnline));
    }

    return updatedServices;
  }

  String? _healthHostFor(String serviceName) {
    switch (serviceName) {
      case 'Vaultwarden':
        return 'vaultwarden.home';
      default:
        return null;
    }
  }
}
