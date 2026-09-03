import 'package:freezed_annotation/freezed_annotation.dart';

part 'lidarr.freezed.dart';
part 'lidarr.g.dart';

@freezed
abstract class LidarrArtist with _$LidarrArtist {
  const factory LidarrArtist({
    required String? id,
    required String artistName,
    required String? mbid,
    required String? status,
    @Default(false) bool monitored,
    @Default(false) bool isAdded,
    String? remotePoster,
    String? disambiguation,
  }) = _LidarrArtist;

  factory LidarrArtist.fromJson(Map<String, dynamic> json) => _$LidarrArtistFromJson(json);
}

@freezed
abstract class LidarrAlbum with _$LidarrAlbum {
  const factory LidarrAlbum({
    required String? id,
    required String title,
    required String artistName,
    required String? releaseDate,
    required String? remoteCover,
    @Default(false) bool monitored,
    @Default(false) bool isInLibrary,
    @Default(false) bool isQueued,
    int? trackFileCount,
    int? trackCount,
  }) = _LidarrAlbum;

  factory LidarrAlbum.fromJson(Map<String, dynamic> json) => _$LidarrAlbumFromJson(json);
}

class LidarrTrack {
  final String? id;
  final String title;
  final int trackNumber;
  final bool hasFile;
  final bool isQueued;

  const LidarrTrack({
    required this.id,
    required this.title,
    required this.trackNumber,
    required this.hasFile,
    this.isQueued = false,
  });

  String get statusLabel {
    if (hasFile) return 'DOWNLOADED';
    if (isQueued) return 'DOWNLOADING';
    return 'MISSING';
  }
}

extension LidarrAlbumAvailability on LidarrAlbum {
  String get availabilityLabel {
    if (!isInLibrary) return 'PREVIEW';
    if (isQueued) return 'DOWNLOADING';
    final total = trackCount ?? 0;
    final downloaded = trackFileCount ?? 0;
    if (total == 0) return 'UNKNOWN';
    if (downloaded == 0) return 'MISSING';
    if (downloaded < total) return 'PARTIAL';
    return 'DOWNLOADED';
  }

  bool get canSearch => isInLibrary && id != null && availabilityLabel != 'DOWNLOADED' && !isQueued;

  String get actionLabel {
    if (!isInLibrary) return 'PREVIEW';
    if (isQueued || availabilityLabel == 'DOWNLOADING') return 'DOWNLOADING';
    if (availabilityLabel == 'DOWNLOADED') return 'DOWNLOADED';
    return 'SEARCH';
  }

  bool get isActionEnabled => canSearch;
}
