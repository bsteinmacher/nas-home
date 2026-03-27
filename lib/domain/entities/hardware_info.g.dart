// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hardware_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HardwareInfo _$HardwareInfoFromJson(Map<String, dynamic> json) =>
    _HardwareInfo(
      hostname: json['hostname'] as String,
      cpuUsage: (json['cpuUsage'] as num).toDouble(),
      ramUsed: (json['ramUsed'] as num).toDouble(),
      ramTotal: (json['ramTotal'] as num).toDouble(),
      uptime: json['uptime'] as String,
      temperature: (json['temperature'] as num).toDouble(),
    );

Map<String, dynamic> _$HardwareInfoToJson(_HardwareInfo instance) =>
    <String, dynamic>{
      'hostname': instance.hostname,
      'cpuUsage': instance.cpuUsage,
      'ramUsed': instance.ramUsed,
      'ramTotal': instance.ramTotal,
      'uptime': instance.uptime,
      'temperature': instance.temperature,
    };
