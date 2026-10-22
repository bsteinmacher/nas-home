import 'package:mocktail/mocktail.dart';
import 'package:nas_home/data/datasources/registry_datasource.dart';
import 'package:nas_home/domain/entities/nas_service.dart';
import 'package:nas_home/domain/repositories/nas_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockNasRepository extends Mock implements NasRepository {}

class MockRegistryDataSource extends Mock implements RegistryDataSource {}

/// Registra fallback values necessarios para `any()` do mocktail em
/// parametros tipados (NasService em refreshServiceUpdateInfo).
void registerTestFallbackValues() {
  registerFallbackValue(
    const NasService(name: 'fallback', port: '', description: ''),
  );
}

class MockSharedPreferences extends Mock implements SharedPreferences {}
