// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radarr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RadarrMovie _$RadarrMovieFromJson(Map<String, dynamic> json) => _RadarrMovie(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  year: (json['year'] as num).toInt(),
  status: json['status'] as String,
  monitored: json['monitored'] as bool,
  remotePoster: json['remotePoster'] as String?,
  sizeOnDisk: (json['sizeOnDisk'] as num?)?.toInt(),
);

Map<String, dynamic> _$RadarrMovieToJson(_RadarrMovie instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'year': instance.year,
      'status': instance.status,
      'monitored': instance.monitored,
      'remotePoster': instance.remotePoster,
      'sizeOnDisk': instance.sizeOnDisk,
    };
