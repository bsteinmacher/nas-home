import '../../domain/entities/music_dl.dart';
import '../../domain/repositories/music_dl_repository.dart';
import '../datasources/music_dl_datasource.dart';

class MusicDlRepositoryImpl implements MusicDlRepository {
  final MusicDlDataSource dataSource;

  MusicDlRepositoryImpl(this.dataSource);

  @override
  Future<List<MusicFolder>> getFolders() => dataSource.getFolders();

  @override
  Future<List<MusicFolder>> createFolder(String name) =>
      dataSource.createFolder(name);

  @override
  Future<List<MusicDlJob>> getJobs() => dataSource.getJobs();

  @override
  Future<MusicDlJob> getJob(String id) => dataSource.getJob(id);

  @override
  Future<MusicDlInspection> inspect(String url) => dataSource.inspect(url);

  @override
  Future<MusicDlJob> createJob({
    required String url,
    String? folder,
    bool setAlbum = true,
    String? kind,
    String? artist,
    String? album,
    String? title,
  }) => dataSource.createJob(
    url: url,
    folder: folder,
    setAlbum: setAlbum,
    kind: kind,
    artist: artist,
    album: album,
    title: title,
  );

  @override
  Future<MusicDlJob> resyncFolder(String name) => dataSource.resyncFolder(name);
}
