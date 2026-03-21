// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Artist _$ArtistFromJson(Map<String, dynamic> json) => _Artist(
  id: json['id'] as String,
  name: json['name'] as String,
  albumCount: (json['albumCount'] as num).toInt(),
);

Map<String, dynamic> _$ArtistToJson(_Artist instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'albumCount': instance.albumCount,
};

_Album _$AlbumFromJson(Map<String, dynamic> json) => _Album(
  id: json['id'] as String,
  title: json['title'] as String,
  artist: json['artist'] as String,
  coverArt: json['coverArt'] as String?,
);

Map<String, dynamic> _$AlbumToJson(_Album instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'artist': instance.artist,
  'coverArt': instance.coverArt,
};
