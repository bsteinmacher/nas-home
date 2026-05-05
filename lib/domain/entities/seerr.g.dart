// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seerr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SeerrSeason _$SeerrSeasonFromJson(Map<String, dynamic> json) => _SeerrSeason(
  seasonNumber: (json['seasonNumber'] as num).toInt(),
  episodeCount: (json['episodeCount'] as num).toInt(),
  airDate: json['airDate'] as String?,
  overview: json['overview'] as String?,
  posterPath: json['posterPath'] as String?,
);

Map<String, dynamic> _$SeerrSeasonToJson(_SeerrSeason instance) =>
    <String, dynamic>{
      'seasonNumber': instance.seasonNumber,
      'episodeCount': instance.episodeCount,
      'airDate': instance.airDate,
      'overview': instance.overview,
      'posterPath': instance.posterPath,
    };

_Seerr _$SeerrFromJson(Map<String, dynamic> json) => _Seerr(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  overview: json['overview'] as String?,
  posterPath: json['posterPath'] as String?,
  mediaType: json['mediaType'] as String,
  releaseDate: json['releaseDate'] as String?,
  isRequested: json['isRequested'] as bool? ?? false,
  status: (json['status'] as num?)?.toInt(),
  seasons:
      (json['seasons'] as List<dynamic>?)
          ?.map((e) => SeerrSeason.fromJson(e as Map<String, dynamic>))
          .toList(),
  tvdbId: (json['tvdbId'] as num?)?.toInt(),
  tmdbId: (json['tmdbId'] as num?)?.toInt(),
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
  'seasons': instance.seasons,
  'tvdbId': instance.tvdbId,
  'tmdbId': instance.tmdbId,
};
