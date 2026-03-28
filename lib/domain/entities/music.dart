import 'package:freezed_annotation/freezed_annotation.dart';

part 'music.freezed.dart';
part 'music.g.dart';

@freezed
abstract class Artist with _$Artist {
  const factory Artist({
    required String? id, // Lidarr ID (null se não adicionado)
    required String artistName,
    required String? mbid, // MusicBrainz ID
    required String? status,
    @Default(false) bool monitored,
    @Default(false) bool isAdded,
    String? remotePoster,
  }) = _Artist;

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);
}

@freezed
abstract class Album with _$Album {
  const factory Album({
    required String? id,
    required String title,
    required String artistName,
    required String? releaseDate,
    required String? remoteCover,
    @Default(false) bool monitored,
  }) = _Album;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}
