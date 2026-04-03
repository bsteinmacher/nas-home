// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lidarr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LidarrArtist _$LidarrArtistFromJson(Map<String, dynamic> json) =>
    _LidarrArtist(
      id: json['id'] as String?,
      artistName: json['artistName'] as String,
      mbid: json['mbid'] as String?,
      status: json['status'] as String?,
      monitored: json['monitored'] as bool? ?? false,
      isAdded: json['isAdded'] as bool? ?? false,
      remotePoster: json['remotePoster'] as String?,
    );

Map<String, dynamic> _$LidarrArtistToJson(_LidarrArtist instance) =>
    <String, dynamic>{
      'id': instance.id,
      'artistName': instance.artistName,
      'mbid': instance.mbid,
      'status': instance.status,
      'monitored': instance.monitored,
      'isAdded': instance.isAdded,
      'remotePoster': instance.remotePoster,
    };

_LidarrAlbum _$LidarrAlbumFromJson(Map<String, dynamic> json) => _LidarrAlbum(
  id: json['id'] as String?,
  title: json['title'] as String,
  artistName: json['artistName'] as String,
  releaseDate: json['releaseDate'] as String?,
  remoteCover: json['remoteCover'] as String?,
  monitored: json['monitored'] as bool? ?? false,
);

Map<String, dynamic> _$LidarrAlbumToJson(_LidarrAlbum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'artistName': instance.artistName,
      'releaseDate': instance.releaseDate,
      'remoteCover': instance.remoteCover,
      'monitored': instance.monitored,
    };
