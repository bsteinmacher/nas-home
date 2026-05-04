// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prowlarr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProwlarrIndexer _$ProwlarrIndexerFromJson(Map<String, dynamic> json) =>
    _ProwlarrIndexer(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      protocol: json['protocol'] as String,
      status: json['status'] as String,
      enabled: json['enabled'] as bool,
    );

Map<String, dynamic> _$ProwlarrIndexerToJson(_ProwlarrIndexer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'protocol': instance.protocol,
      'status': instance.status,
      'enabled': instance.enabled,
    };
