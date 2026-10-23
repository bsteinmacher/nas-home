// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_dl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicFolder _$MusicFolderFromJson(Map<String, dynamic> json) => _MusicFolder(
  name: json['name'] as String,
  trackCount: (json['track_count'] as num?)?.toInt() ?? 0,
  sourceUrl: json['source_url'] as String?,
  setAlbum: json['set_album'] as bool? ?? true,
);

Map<String, dynamic> _$MusicFolderToJson(_MusicFolder instance) =>
    <String, dynamic>{
      'name': instance.name,
      'track_count': instance.trackCount,
      'source_url': instance.sourceUrl,
      'set_album': instance.setAlbum,
    };

_MusicDlJob _$MusicDlJobFromJson(Map<String, dynamic> json) => _MusicDlJob(
  id: json['id'] as String,
  url: json['url'] as String,
  folder: json['folder'] as String,
  setAlbum: json['set_album'] as bool? ?? true,
  mode: json['mode'] as String,
  status: json['status'] as String,
  percent: (json['percent'] as num?)?.toDouble() ?? 0,
  title: json['title'] as String?,
  currentItem: (json['current_item'] as num?)?.toInt(),
  totalItems: (json['total_items'] as num?)?.toInt(),
  error: json['error'] as String?,
  sponsorblockCut: json['sponsorblock_cut'] as bool? ?? false,
  outputPath: json['output_path'] as String?,
  artist: json['artist'] as String?,
  album: json['album'] as String?,
  files:
      (json['files'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$MusicDlJobToJson(_MusicDlJob instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'folder': instance.folder,
      'set_album': instance.setAlbum,
      'mode': instance.mode,
      'status': instance.status,
      'percent': instance.percent,
      'title': instance.title,
      'current_item': instance.currentItem,
      'total_items': instance.totalItems,
      'error': instance.error,
      'sponsorblock_cut': instance.sponsorblockCut,
      'output_path': instance.outputPath,
      'artist': instance.artist,
      'album': instance.album,
      'files': instance.files,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_MusicDlInspection _$MusicDlInspectionFromJson(Map<String, dynamic> json) =>
    _MusicDlInspection(
      kind: json['kind'] as String,
      url: json['url'] as String,
      title: json['title'] as String?,
      artist: json['artist'] as String?,
      trackCount: (json['track_count'] as num?)?.toInt(),
      suggestedArtist: json['suggested_artist'] as String?,
      suggestedAlbum: json['suggested_album'] as String?,
      suggestedFolder: json['suggested_folder'] as String?,
      existingFolder: json['existing_folder'] as String?,
      listId: json['list_id'] as String?,
    );

Map<String, dynamic> _$MusicDlInspectionToJson(_MusicDlInspection instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'url': instance.url,
      'title': instance.title,
      'artist': instance.artist,
      'track_count': instance.trackCount,
      'suggested_artist': instance.suggestedArtist,
      'suggested_album': instance.suggestedAlbum,
      'suggested_folder': instance.suggestedFolder,
      'existing_folder': instance.existingFolder,
      'list_id': instance.listId,
    };
