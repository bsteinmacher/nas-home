// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Artist _$ArtistFromJson(Map<String, dynamic> json) => _Artist(
  id: json['id'] as String?,
  artistName: json['artistName'] as String,
  mbid: json['mbid'] as String?,
  status: json['status'] as String?,
  monitored: json['monitored'] as bool? ?? false,
  isAdded: json['isAdded'] as bool? ?? false,
  remotePoster: json['remotePoster'] as String?,
);

Map<String, dynamic> _$ArtistToJson(_Artist instance) => <String, dynamic>{
  'id': instance.id,
  'artistName': instance.artistName,
  'mbid': instance.mbid,
  'status': instance.status,
  'monitored': instance.monitored,
  'isAdded': instance.isAdded,
  'remotePoster': instance.remotePoster,
};

_Album _$AlbumFromJson(Map<String, dynamic> json) => _Album(
  id: json['id'] as String?,
  title: json['title'] as String,
  artistName: json['artistName'] as String,
  releaseDate: json['releaseDate'] as String?,
  remoteCover: json['remoteCover'] as String?,
  monitored: json['monitored'] as bool? ?? false,
);

Map<String, dynamic> _$AlbumToJson(_Album instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'artistName': instance.artistName,
  'releaseDate': instance.releaseDate,
  'remoteCover': instance.remoteCover,
  'monitored': instance.monitored,
};
