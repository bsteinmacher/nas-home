import 'package:freezed_annotation/freezed_annotation.dart';

part 'music.freezed.dart';
part 'music.g.dart';

@freezed
abstract class Artist with _$Artist {
  const factory Artist({
    required String id,
    required String name,
    required int albumCount,
  }) = _Artist;

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);
}

@freezed
abstract class Album with _$Album {
  const factory Album({
    required String id,
    required String title,
    required String artist,
    required String? coverArt,
  }) = _Album;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}
