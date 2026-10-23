import '../entities/music_dl.dart';

abstract class MusicDlRepository {
  Future<List<MusicFolder>> getFolders();
  Future<List<MusicFolder>> createFolder(String name);
  Future<List<MusicDlJob>> getJobs();
  Future<MusicDlJob> getJob(String id);
  Future<MusicDlInspection> inspect(String url);
  Future<MusicDlJob> createJob({
    required String url,
    String? folder,
    bool setAlbum = true,
    String? kind,
    String? artist,
    String? album,
    String? title,
  });
  Future<MusicDlJob> resyncFolder(String name);
}
