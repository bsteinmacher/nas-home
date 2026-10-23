import '../entities/music_dl.dart';
import '../repositories/music_dl_repository.dart';

class GetMusicFoldersUseCase {
  final MusicDlRepository repository;
  GetMusicFoldersUseCase(this.repository);
  Future<List<MusicFolder>> execute() => repository.getFolders();
}

class CreateMusicFolderUseCase {
  final MusicDlRepository repository;
  CreateMusicFolderUseCase(this.repository);
  Future<List<MusicFolder>> execute(String name) =>
      repository.createFolder(name);
}

class GetMusicJobsUseCase {
  final MusicDlRepository repository;
  GetMusicJobsUseCase(this.repository);
  Future<List<MusicDlJob>> execute() => repository.getJobs();
}

class GetMusicJobUseCase {
  final MusicDlRepository repository;
  GetMusicJobUseCase(this.repository);
  Future<MusicDlJob> execute(String id) => repository.getJob(id);
}

class InspectMusicUrlUseCase {
  final MusicDlRepository repository;
  InspectMusicUrlUseCase(this.repository);
  Future<MusicDlInspection> execute(String url) => repository.inspect(url);
}

class CreateMusicJobUseCase {
  final MusicDlRepository repository;
  CreateMusicJobUseCase(this.repository);
  Future<MusicDlJob> execute({
    required String url,
    String? folder,
    bool setAlbum = true,
    String? kind,
    String? artist,
    String? album,
    String? title,
  }) => repository.createJob(
    url: url,
    folder: folder,
    setAlbum: setAlbum,
    kind: kind,
    artist: artist,
    album: album,
    title: title,
  );
}

class ResyncMusicFolderUseCase {
  final MusicDlRepository repository;
  ResyncMusicFolderUseCase(this.repository);
  Future<MusicDlJob> execute(String name) => repository.resyncFolder(name);
}
