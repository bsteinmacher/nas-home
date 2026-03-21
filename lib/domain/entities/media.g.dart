// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Media _$MediaFromJson(Map<String, dynamic> json) => _Media(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  overview: json['overview'] as String?,
  posterPath: json['posterPath'] as String?,
  mediaType: json['mediaType'] as String,
  releaseDate: json['releaseDate'] as String?,
  isRequested: json['isRequested'] as bool? ?? false,
);

Map<String, dynamic> _$MediaToJson(_Media instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'overview': instance.overview,
  'posterPath': instance.posterPath,
  'mediaType': instance.mediaType,
  'releaseDate': instance.releaseDate,
  'isRequested': instance.isRequested,
};
