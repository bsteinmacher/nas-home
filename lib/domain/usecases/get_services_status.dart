import '../entities/nas_service.dart';
import '../repositories/nas_repository.dart';

class GetServicesStatusUseCase {
  final NasRepository repository;

  GetServicesStatusUseCase(this.repository);

  Future<List<NasService>> execute(String nasUrl) async {
    final services = await repository.getServices();
    final updatedServices = <NasService>[];

    for (var service in services) {
      final isOnline = await repository.checkServiceStatus(nasUrl, service.port);
      updatedServices.add(service.copyWith(isOnline: isOnline));
    }

    return updatedServices;
  }
}
