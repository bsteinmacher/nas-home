import '../../domain/entities/media.dart';
import '../../domain/repositories/jellyseerr_repository.dart';
import '../datasources/jellyseerr_datasource.dart';

class JellyseerrRepositoryImpl implements JellyseerrRepository {
  final JellyseerrDataSource dataSource;

  JellyseerrRepositoryImpl(this.dataSource);

  @override
  Future<List<Media>> search(String query) => dataSource.search(query);

  @override
  Future<List<Media>> getTrending() => dataSource.getTrending();

  @override
  Future<void> requestMedia(int mediaId, String mediaType) =>
      dataSource.requestMedia(mediaId, mediaType);
}
