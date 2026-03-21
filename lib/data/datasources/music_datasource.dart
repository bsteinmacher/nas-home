import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import '../../domain/entities/music.dart';

abstract class MusicDataSource {
  Future<List<Artist>> getArtists();
  Future<List<Album>> getAlbums(String artistId);
}

class SubsonicDataSourceImpl implements MusicDataSource {
  final Dio dio;
  final String baseUrl;
  final String user;
  final String password;

  SubsonicDataSourceImpl({
    required this.dio,
    required this.baseUrl,
    required this.user,
    required this.password,
  });

  Map<String, String> _getAuthParams() {
    final salt = DateTime.now().millisecondsSinceEpoch.toString();
    final token = md5.convert(utf8.encode(password + salt)).toString();
    return {
      'u': user,
      't': token,
      's': salt,
      'v': '1.16.1',
      'c': 'nas_home',
      'f': 'json',
    };
  }

  @override
  Future<List<Artist>> getArtists() async {
    final response = await dio.get(
      '$baseUrl:4533/rest/getArtists',
      queryParameters: _getAuthParams(),
    );

    final artists = response.data['subsonic-response']['artists']['index'] as List;
    final flatArtists = artists.expand((e) => e['artist'] as List).toList();
    return flatArtists.map((e) => Artist(
      id: e['id'],
      name: e['name'],
      albumCount: e['albumCount'] ?? 0,
    )).toList();
  }

  @override
  Future<List<Album>> getAlbums(String artistId) async {
    final response = await dio.get(
      '$baseUrl:4533/rest/getArtist',
      queryParameters: {..._getAuthParams(), 'id': artistId},
    );

    final albums = response.data['subsonic-response']['artist']['album'] as List;
    return albums.map((e) => Album(
      id: e['id'],
      title: e['title'],
      artist: e['artist'],
      coverArt: e['coverArt'],
    )).toList();
  }
}
