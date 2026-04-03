import 'package:freezed_annotation/freezed_annotation.dart';

part 'seerr.freezed.dart';
part 'seerr.g.dart';

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
  }) = _Seerr;

  factory Seerr.fromJson(Map<String, dynamic> json) => _$SeerrFromJson(json);
}
