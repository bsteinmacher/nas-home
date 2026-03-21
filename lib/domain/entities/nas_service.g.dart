// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nas_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NasService _$NasServiceFromJson(Map<String, dynamic> json) => _NasService(
  name: json['name'] as String,
  port: json['port'] as String,
  description: json['description'] as String,
  isOnline: json['isOnline'] as bool? ?? false,
);

Map<String, dynamic> _$NasServiceToJson(_NasService instance) =>
    <String, dynamic>{
      'name': instance.name,
      'port': instance.port,
      'description': instance.description,
      'isOnline': instance.isOnline,
    };
