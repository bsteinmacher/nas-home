import 'package:freezed_annotation/freezed_annotation.dart';

part 'nas_service.freezed.dart';
part 'nas_service.g.dart';

@freezed
abstract class NasService with _$NasService {
  const factory NasService({
    required String name,
    required String port,
    required String description,
    @Default(false) bool isOnline,
  }) = _NasService;

  factory NasService.fromJson(Map<String, dynamic> json) => _$NasServiceFromJson(json);
}
