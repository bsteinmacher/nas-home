import '../entities/nas_service.dart';
import '../entities/hardware_info.dart';

abstract class NasRepository {
  Future<List<NasService>> getServices();
  Future<bool> checkServiceStatus(String baseUrl, String port);
  Future<HardwareInfo> getHardwareInfo(String baseUrl);
}
