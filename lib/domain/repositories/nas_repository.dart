import '../entities/nas_service.dart';

abstract class NasRepository {
  Future<List<NasService>> getServices();
  Future<bool> checkServiceStatus(String baseUrl, String port);
}
