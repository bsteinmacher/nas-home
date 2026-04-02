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
    required double downloadSpeed,
    required double uploadSpeed,
    required double ssdUsed,
    required double ssdTotal,
    required double hddUsed,
    required double hddTotal,
  }) = _HardwareInfo;

  factory HardwareInfo.fromJson(Map<String, dynamic> json) => _$HardwareInfoFromJson(json);
}
