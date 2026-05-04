import 'package:freezed_annotation/freezed_annotation.dart';

part 'sonarr.freezed.dart';
part 'sonarr.g.dart';

@freezed
abstract class SonarrSeries with _$SonarrSeries {
  const factory SonarrSeries({
    required int id,
    required String title,
    required int year,
    required String status,
    required bool monitored,
    String? remotePoster,
    int? seasonCount,
  }) = _SonarrSeries;

  factory SonarrSeries.fromJson(Map<String, dynamic> json) => _$SonarrSeriesFromJson(json);
}
