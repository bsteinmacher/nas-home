import 'package:freezed_annotation/freezed_annotation.dart';

part 'prowlarr.freezed.dart';
part 'prowlarr.g.dart';

@freezed
abstract class ProwlarrIndexer with _$ProwlarrIndexer {
  const factory ProwlarrIndexer({
    required int id,
    required String name,
    required String protocol,
    required String status,
    required bool enabled,
  }) = _ProwlarrIndexer;

  factory ProwlarrIndexer.fromJson(Map<String, dynamic> json) => _$ProwlarrIndexerFromJson(json);
}
