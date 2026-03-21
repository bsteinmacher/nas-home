import '../entities/media.dart';

abstract class JellyseerrRepository {
  Future<List<Media>> search(String query);
  Future<List<Media>> getTrending();
  Future<void> requestMedia(int mediaId, String mediaType);
}
