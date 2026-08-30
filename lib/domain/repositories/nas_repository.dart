import '../entities/nas_service.dart';
import '../entities/hardware_info.dart';

abstract class NasRepository {
  Future<List<NasService>> getServices();
  Future<List<NasService>> getServicesWithUpdates(String baseUrl, String token, {bool force = false});
  Future<bool> checkServiceStatus(String baseUrl, String port, {String? hostHeader});
  Future<HardwareInfo> getHardwareInfo(String baseUrl);
  Future<void> updateService(String baseUrl, String token, String serviceName);
}
