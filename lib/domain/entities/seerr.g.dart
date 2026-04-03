// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seerr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Seerr _$SeerrFromJson(Map<String, dynamic> json) => _Seerr(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  overview: json['overview'] as String?,
  posterPath: json['posterPath'] as String?,
  mediaType: json['mediaType'] as String,
  releaseDate: json['releaseDate'] as String?,
  isRequested: json['isRequested'] as bool? ?? false,
  status: (json['status'] as num?)?.toInt(),
);

Map<String, dynamic> _$SeerrToJson(_Seerr instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'overview': instance.overview,
  'posterPath': instance.posterPath,
  'mediaType': instance.mediaType,
  'releaseDate': instance.releaseDate,
  'isRequested': instance.isRequested,
  'status': instance.status,
};
