import 'package:freezed_annotation/freezed_annotation.dart';

part 'hardware_info.freezed.dart';
part 'hardware_info.g.dart';

@freezed
abstract class HardwareInfo with _$HardwareInfo {
  const factory HardwareInfo({
    required String hostname,
    required double cpuUsage,
    required double ramUsed,
    required double ramTotal,
    required String uptime,
    required double temperature,
  }) = _HardwareInfo;

  factory HardwareInfo.fromJson(Map<String, dynamic> json) => _$HardwareInfoFromJson(json);
}
