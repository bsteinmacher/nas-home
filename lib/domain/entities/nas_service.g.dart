// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nas_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NasService _$NasServiceFromJson(Map<String, dynamic> json) => _NasService(
  name: json['name'] as String,
  port: json['port'] as String,
  description: json['description'] as String,
  isDeployed: json['isDeployed'] as bool? ?? true,
  isOnline: json['isOnline'] as bool? ?? false,
  updateAvailable: json['updateAvailable'] as bool? ?? false,
  containerName: json['containerName'] as String?,
  localDigest: json['localDigest'] as String?,
  remoteDigest: json['remoteDigest'] as String?,
  localVersion: json['localVersion'] as String?,
  remoteLastUpdated: json['remoteLastUpdated'] as String?,
  imageTag: json['imageTag'] as String?,
);

Map<String, dynamic> _$NasServiceToJson(_NasService instance) =>
    <String, dynamic>{
      'name': instance.name,
      'port': instance.port,
      'description': instance.description,
      'isDeployed': instance.isDeployed,
      'isOnline': instance.isOnline,
      'updateAvailable': instance.updateAvailable,
      'containerName': instance.containerName,
      'localDigest': instance.localDigest,
      'remoteDigest': instance.remoteDigest,
      'localVersion': instance.localVersion,
      'remoteLastUpdated': instance.remoteLastUpdated,
      'imageTag': instance.imageTag,
    };
