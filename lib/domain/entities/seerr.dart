import 'package:freezed_annotation/freezed_annotation.dart';

part 'seerr.freezed.dart';
part 'seerr.g.dart';

@freezed
abstract class SeerrSeason with _$SeerrSeason {
  const factory SeerrSeason({
    required int seasonNumber,
    required int episodeCount,
    required String? airDate,
    required String? overview,
    required String? posterPath,
  }) = _SeerrSeason;

  factory SeerrSeason.fromJson(Map<String, dynamic> json) => _$SeerrSeasonFromJson(json);
}

@freezed
abstract class Seerr with _$Seerr {
  const factory Seerr({
    required int id,
    required String title,
    required String? overview,
    required String? posterPath,
    required String mediaType, // movie or tv
    required String? releaseDate,
    @Default(false) bool isRequested,
    int? status,
    List<SeerrSeason>? seasons,
    int? tvdbId,
    int? tmdbId,
  }) = _Seerr;

  factory Seerr.fromJson(Map<String, dynamic> json) => _$SeerrFromJson(json);
}
