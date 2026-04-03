import '../../domain/entities/seerr.dart';
import '../../domain/repositories/seerr_repository.dart';
import '../datasources/seerr_datasource.dart';

class SeerrRepositoryImpl implements SeerrRepository {
  final SeerrDataSource dataSource;

  SeerrRepositoryImpl(this.dataSource);

  @override
  Future<List<Seerr>> search(String query) => dataSource.search(query);

  @override
  Future<List<Seerr>> getTrending() => dataSource.getTrending();

  @override
  Future<void> requestMedia(int mediaId, String mediaType) =>
      dataSource.requestMedia(mediaId, mediaType);
}
