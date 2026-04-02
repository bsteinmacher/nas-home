import '../entities/media.dart';

abstract class SeerrRepository {
  Future<List<Media>> search(String query);
  Future<List<Media>> getTrending();
  Future<void> requestMedia(int mediaId, String mediaType);
}
