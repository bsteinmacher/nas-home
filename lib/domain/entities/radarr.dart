import 'package:freezed_annotation/freezed_annotation.dart';

part 'radarr.freezed.dart';
part 'radarr.g.dart';

@freezed
abstract class RadarrMovie with _$RadarrMovie {
  const factory RadarrMovie({
    required int id,
    required String title,
    required int year,
    required String status,
    required bool monitored,
    String? remotePoster,
    int? sizeOnDisk,
  }) = _RadarrMovie;

  factory RadarrMovie.fromJson(Map<String, dynamic> json) => _$RadarrMovieFromJson(json);
}
