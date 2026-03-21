import 'package:freezed_annotation/freezed_annotation.dart';

part 'media.freezed.dart';
part 'media.g.dart';

@freezed
abstract class Media with _$Media {
  const factory Media({
    required int id,
    required String title,
    required String? overview,
    required String? posterPath,
    required String mediaType, // movie or tv
    required String? releaseDate,
    @Default(false) bool isRequested,
  }) = _Media;

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
}
