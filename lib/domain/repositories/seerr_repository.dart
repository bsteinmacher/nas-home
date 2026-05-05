import '../entities/seerr.dart';

abstract class SeerrRepository {
  Future<List<Seerr>> search(String query);
  Future<List<Seerr>> getTrending();
  Future<Seerr> getDetails(int mediaId, String mediaType);
  Future<void> requestMedia(int mediaId, String mediaType, {List<int>? seasons});
}
