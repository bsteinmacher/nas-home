import 'package:freezed_annotation/freezed_annotation.dart';

part 'lidarr.freezed.dart';
part 'lidarr.g.dart';

@freezed
abstract class LidarrArtist with _$LidarrArtist {
  const factory LidarrArtist({
    required String? id, // Lidarr ID (null se não adicionado)
    required String artistName,
    required String? mbid, // MusicBrainz ID
    required String? status,
    @Default(false) bool monitored,
    @Default(false) bool isAdded,
    String? remotePoster,
  }) = _LidarrArtist;

  factory LidarrArtist.fromJson(Map<String, dynamic> json) => _$LidarrArtistFromJson(json);
}

@freezed
abstract class LidarrAlbum with _$LidarrAlbum {
  const factory LidarrAlbum({
    required String? id,
    required String title,
    required String artistName,
    required String? releaseDate,
    required String? remoteCover,
    @Default(false) bool monitored,
  }) = _LidarrAlbum;

  factory LidarrAlbum.fromJson(Map<String, dynamic> json) => _$LidarrAlbumFromJson(json);
}
