// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sonarr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SonarrSeries _$SonarrSeriesFromJson(Map<String, dynamic> json) =>
    _SonarrSeries(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      year: (json['year'] as num).toInt(),
      status: json['status'] as String,
      monitored: json['monitored'] as bool,
      remotePoster: json['remotePoster'] as String?,
      seasonCount: (json['seasonCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SonarrSeriesToJson(_SonarrSeries instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'year': instance.year,
      'status': instance.status,
      'monitored': instance.monitored,
      'remotePoster': instance.remotePoster,
      'seasonCount': instance.seasonCount,
    };
