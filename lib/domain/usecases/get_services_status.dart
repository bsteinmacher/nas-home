import 'package:flutter/foundation.dart';

import '../entities/nas_service.dart';
import '../repositories/nas_repository.dart';

class GetServicesStatusUseCase {
  final NasRepository repository;

  GetServicesStatusUseCase(this.repository);

  Future<List<NasService>> execute(String nasUrl, {String? registryToken, bool force = false}) async {
    final totalSw = Stopwatch()..start();

    final catalogSw = Stopwatch()..start();
    List<NasService> services;
    if (registryToken != null && registryToken.isNotEmpty) {
      services = await repository.getServicesWithUpdates(nasUrl, registryToken, force: force);
    } else {
      services = await repository.getServices();
    }
    catalogSw.stop();
    debugPrint(
      'TIMING: [SERVICES] catalog (${services.length}) in ${catalogSw.elapsedMilliseconds}ms '
      '(registry=${registryToken != null && registryToken.isNotEmpty}, force=$force)',
    );

    final healthSw = Stopwatch()..start();
    final updatedServices = <NasService>[];

    for (var service in services) {
      if (!service.isDeployed || service.port.isEmpty) {
        debugPrint('TIMING: [HEALTH] ${service.name} SKIPPED (not deployed)');
        updatedServices.add(service.copyWith(isOnline: false));
        continue;
      }
      final hostHeader = _healthHostFor(service.name);
      final probeSw = Stopwatch()..start();
      final isOnline = await repository.checkServiceStatus(
        nasUrl,
        service.port,
        hostHeader: hostHeader,
      );
      probeSw.stop();
      debugPrint(
        'TIMING: [HEALTH] ${service.name} :${service.port} '
        '${isOnline ? "ONLINE" : "OFFLINE"} in ${probeSw.elapsedMilliseconds}ms',
      );
      updatedServices.add(service.copyWith(isOnline: isOnline));
    }
    healthSw.stop();

    totalSw.stop();
    debugPrint(
      'TIMING: [SERVICES] TOTAL ${totalSw.elapsedMilliseconds}ms '
      '(catalog=${catalogSw.elapsedMilliseconds}ms, '
      'health_seq=${healthSw.elapsedMilliseconds}ms)',
    );

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
