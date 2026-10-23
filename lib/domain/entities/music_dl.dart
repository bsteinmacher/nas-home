import 'package:freezed_annotation/freezed_annotation.dart';

part 'music_dl.freezed.dart';
part 'music_dl.g.dart';

@freezed
abstract class MusicFolder with _$MusicFolder {
  const factory MusicFolder({
    required String name,
    @JsonKey(name: 'track_count') @Default(0) int trackCount,
    @JsonKey(name: 'source_url') String? sourceUrl,
    @JsonKey(name: 'set_album') @Default(true) bool setAlbum,
  }) = _MusicFolder;

  factory MusicFolder.fromJson(Map<String, dynamic> json) =>
      _$MusicFolderFromJson(json);
}

@freezed
abstract class MusicDlJob with _$MusicDlJob {
  const MusicDlJob._();

  const factory MusicDlJob({
    required String id,
    required String url,
    required String folder,
    @JsonKey(name: 'set_album') @Default(true) bool setAlbum,
    required String mode,
    required String status,
    @Default(0) double percent,
    String? title,
    @JsonKey(name: 'current_item') int? currentItem,
    @JsonKey(name: 'total_items') int? totalItems,
    String? error,
    @JsonKey(name: 'sponsorblock_cut') @Default(false) bool sponsorblockCut,
    @JsonKey(name: 'output_path') String? outputPath,
    String? artist,
    String? album,
    @Default([]) List<String> files,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _MusicDlJob;

  factory MusicDlJob.fromJson(Map<String, dynamic> json) =>
      _$MusicDlJobFromJson(json);

  bool get isActive =>
      status == 'queued' || status == 'downloading' || status == 'processing';

  double get overallPercent {
    if (status == 'done') return 100;
    if (status == 'error') return percent;
    final total = totalItems;
    final current = currentItem;
    if (total == null || total <= 0 || current == null) {
      return percent.clamp(0, 100);
    }
    final fileFraction = (percent / 100).clamp(0.0, 1.0);
    final index = current.clamp(1, total);
    return ((index - 1 + fileFraction) / total * 100).clamp(0, 100);
  }

  String get listLabel {
    final cut = sponsorblockCut ? 'CUT' : null;
    if (mode == 'album') {
      final heading = [
        if (artist != null && artist!.trim().isNotEmpty) artist!.trim(),
        if (album != null && album!.trim().isNotEmpty) album!.trim(),
      ].join(' - ');
      final name = heading.isNotEmpty ? heading : folder.replaceAll('/', ' - ');
      return [
        name,
        if (totalItems != null) '${currentItem ?? 0}/$totalItems',
        if (cut != null) cut,
      ].join(' - ');
    }
    if (mode == 'playlist') {
      final name = (title != null && title!.trim().isNotEmpty)
          ? title!.trim()
          : folder.replaceAll('/', ' - ');
      return [
        name,
        if (totalItems != null) '${currentItem ?? 0}/$totalItems',
        if (cut != null) cut,
      ].join(' - ');
    }
    return [
      if (title != null && title!.trim().isNotEmpty) title!.trim() else folder,
      if (cut != null) cut,
    ].join(' - ');
  }

  bool isSameSource(String otherUrl) {
    final mine = Uri.tryParse(url)?.queryParameters['list'];
    final other = Uri.tryParse(otherUrl)?.queryParameters['list'];
    if (mine != null && mine.isNotEmpty && other != null && other.isNotEmpty) {
      return mine == other;
    }
    return url == otherUrl;
  }
}

@freezed
abstract class MusicDlInspection with _$MusicDlInspection {
  const factory MusicDlInspection({
    required String kind,
    required String url,
    String? title,
    String? artist,
    @JsonKey(name: 'track_count') int? trackCount,
    @JsonKey(name: 'suggested_artist') String? suggestedArtist,
    @JsonKey(name: 'suggested_album') String? suggestedAlbum,
    @JsonKey(name: 'suggested_folder') String? suggestedFolder,
    @JsonKey(name: 'existing_folder') String? existingFolder,
    @JsonKey(name: 'list_id') String? listId,
  }) = _MusicDlInspection;

  factory MusicDlInspection.fromJson(Map<String, dynamic> json) =>
      _$MusicDlInspectionFromJson(json);
}
