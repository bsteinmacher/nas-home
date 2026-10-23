import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/music_dl.dart';

abstract class MusicDlDataSource {
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

class MusicDlDataSourceImpl implements MusicDlDataSource {
  final Dio dio;
  final SharedPreferences sharedPreferences;

  MusicDlDataSourceImpl({required this.dio, required this.sharedPreferences});

  String get _baseUrl {
    String url = sharedPreferences.getString('nas_url') ?? '';
    if (!url.startsWith('http')) {
      url = 'http://$url';
    }
    if (url.endsWith('/')) {
      url = url.substring(0, url.length - 1);
    }
    final uri = Uri.parse(url);
    return '${uri.scheme}://${uri.host}:8010';
  }

  String get _token => sharedPreferences.getString('registry_token') ?? '';

  Options get _authOptions => Options(headers: {'X-Registry-Token': _token});

  List<MusicFolder> _foldersFrom(dynamic data) {
    final raw = (data as Map<String, dynamic>)['folders'] as List;
    return raw
        .map((item) => MusicFolder.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<MusicFolder>> getFolders() async {
    final response = await dio.get('$_baseUrl/folders', options: _authOptions);
    return _foldersFrom(response.data);
  }

  @override
  Future<List<MusicFolder>> createFolder(String name) async {
    final response = await dio.post(
      '$_baseUrl/folders',
      data: {'name': name},
      options: _authOptions,
    );
    return _foldersFrom(response.data);
  }

  @override
  Future<List<MusicDlJob>> getJobs() async {
    final response = await dio.get('$_baseUrl/jobs', options: _authOptions);
    final raw = (response.data as Map<String, dynamic>)['jobs'] as List;
    return raw
        .map((item) => MusicDlJob.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<MusicDlJob> getJob(String id) async {
    final response = await dio.get('$_baseUrl/jobs/$id', options: _authOptions);
    return MusicDlJob.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<MusicDlInspection> inspect(String url) async {
    final response = await dio.post(
      '$_baseUrl/inspect',
      data: {'url': url},
      options: _authOptions,
    );
    return MusicDlInspection.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<MusicDlJob> createJob({
    required String url,
    String? folder,
    bool setAlbum = true,
    String? kind,
    String? artist,
    String? album,
    String? title,
  }) async {
    final response = await dio.post(
      '$_baseUrl/jobs',
      data: {
        'url': url,
        'set_album': setAlbum,
        if (folder != null) 'folder': folder,
        if (kind != null) 'kind': kind,
        if (artist != null) 'artist': artist,
        if (album != null) 'album': album,
        if (title != null) 'title': title,
      },
      options: _authOptions,
    );
    return MusicDlJob.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<MusicDlJob> resyncFolder(String name) async {
    final encoded = Uri.encodeComponent(name);
    final response = await dio.post(
      '$_baseUrl/folders/$encoded/resync',
      options: _authOptions,
    );
    return MusicDlJob.fromJson(response.data as Map<String, dynamic>);
  }
}
