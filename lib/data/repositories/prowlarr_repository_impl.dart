import '../../domain/entities/prowlarr.dart';
import '../../domain/repositories/prowlarr_repository.dart';
import '../datasources/prowlarr_datasource.dart';

class ProwlarrRepositoryImpl implements ProwlarrRepository {
  final ProwlarrDataSource dataSource;

  ProwlarrRepositoryImpl({required this.dataSource});

  @override
  Future<List<ProwlarrIndexer>> getIndexers() async {
    return await dataSource.getIndexers();
  }
}
