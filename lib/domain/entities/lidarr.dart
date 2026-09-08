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

  factory LidarrArtist.fromJson(Map<String, dynamic> json) =>
      _$LidarrArtistFromJson(json);
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
    @Default(false) bool isSearching,
    int? trackFileCount,
    int? trackCount,
  }) = _LidarrAlbum;

  factory LidarrAlbum.fromJson(Map<String, dynamic> json) =>
      _$LidarrAlbumFromJson(json);
}

class LidarrCommand {
  final String id;
  final String status;
  final String? message;

  const LidarrCommand({required this.id, required this.status, this.message});

  bool get isCompleted => status.toLowerCase() == 'completed';

  bool get isFailed {
    const failedStatuses = {'failed', 'aborted', 'cancelled', 'orphaned'};
    return failedStatuses.contains(status.toLowerCase());
  }

  bool get isTerminal => isCompleted || isFailed;
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
    if (isSearching) return 'SEARCHING';
    final total = trackCount ?? 0;
    final downloaded = trackFileCount ?? 0;
    if (total == 0) return 'UNKNOWN';
    if (downloaded == 0) return 'MISSING';
    if (downloaded < total) return 'PARTIAL';
    return 'DOWNLOADED';
  }

  bool get canSearch =>
      isInLibrary &&
      id != null &&
      availabilityLabel != 'DOWNLOADED' &&
      !isQueued &&
      !isSearching;

  String get actionLabel {
    if (!isInLibrary) return 'PREVIEW';
    if (isQueued) return 'DOWNLOADING';
    if (isSearching) return 'SEARCHING';
    if (availabilityLabel == 'DOWNLOADED') return 'DOWNLOADED';
    return 'SEARCH';
  }

  bool get isActionEnabled => canSearch;
}
