import '../entities/hardware_info.dart';
import '../repositories/nas_repository.dart';

class GetHardwareInfoUseCase {
  final NasRepository repository;

  GetHardwareInfoUseCase(this.repository);

  Future<HardwareInfo> execute(String nasUrl) async {
    return await repository.getHardwareInfo(nasUrl);
  }
}
