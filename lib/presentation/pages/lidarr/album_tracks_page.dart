import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../domain/entities/lidarr.dart';
import '../../blocs/lidarr_bloc.dart';
import '../../widgets/braille_spinner.dart';
import '../../widgets/service_scaffold.dart';
import 'lidarr_status_style.dart';

class AlbumTracksPage extends StatefulWidget {
  final LidarrAlbum album;

  const AlbumTracksPage({super.key, required this.album});

  @override
  State<AlbumTracksPage> createState() => _AlbumTracksPageState();
}

class _AlbumTracksPageState extends State<AlbumTracksPage> {
  late LidarrAlbum _album;
  late Future<List<LidarrTrack>> _tracksFuture;
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _album = widget.album;
    _syncAlbumFromBloc();
    _loadTracks();
  }

  void _syncAlbumFromBloc() {
    final albumId = _album.id;
    if (albumId == null) return;

    final bloc = context.read<LidarrBloc>();
    if (bloc.pendingSearchAlbumIds.contains(albumId)) {
      _album = _album.copyWith(isQueued: true);
    }
  }

  void _loadTracks() {
    final albumId = _album.id;
    if (albumId == null) {
      _tracksFuture = Future.value([]);
      return;
    }
    _tracksFuture = context.read<LidarrBloc>().fetchTracks(
          albumId,
          isQueued: _album.isQueued,
        );
  }

  Future<void> _searchAlbum() async {
    final albumId = _album.id;
    if (albumId == null || !_album.isActionEnabled) return;

    setState(() {
      _isSearching = true;
      _album = _album.copyWith(isQueued: true);
    });
    try {
      await context.read<LidarrBloc>().triggerAlbumSearch(albumId);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Busca iniciada: ${_album.title}'),
          backgroundColor: AppColors.terminalGreen.withValues(alpha: 0.8),
        ),
      );
      setState(_loadTracks);
      await _tracksFuture;
    } catch (e) {
      if (!mounted) return;
      setState(() => _album = _album.copyWith(isQueued: false));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString().replaceFirst('Exception: ', '')),
          backgroundColor: Colors.redAccent,
        ),
      );
    } finally {
      if (mounted) setState(() => _isSearching = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final actionLabel = _album.actionLabel;
    final actionColor = lidarrActionButtonColor(actionLabel);
    final canAct = _album.isInLibrary && _album.isActionEnabled && !_isSearching;

    return ServiceScaffold(
      serviceName: 'Lidarr',
      themeColor: AppColors.lidarr,
      body: FutureBuilder<List<LidarrTrack>>(
        future: _tracksFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: BrailleSpinner(fontSize: 24, color: AppColors.lidarr));
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString(), style: AppTypography.moduleLabel));
          }

          final tracks = snapshot.data ?? [];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
                      child: _album.remoteCover != null
                          ? Image.network(
                              _album.remoteCover!,
                              width: 72,
                              height: 72,
                              fit: BoxFit.cover,
                              errorBuilder: (_, _, _) =>
                                  const Icon(Icons.album, size: 48, color: AppColors.textMuted),
                            )
                          : const SizedBox(
                              width: 72,
                              height: 72,
                              child: Icon(Icons.album, size: 48, color: AppColors.textMuted),
                            ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_album.title, style: AppTypography.moduleLabel),
                          Text(
                            _album.releaseDate ?? '—',
                            style: AppTypography.moduleSublabel,
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            _album.availabilityLabel,
                            style: AppTypography.statusBadge.copyWith(
                              color: lidarrStatusColor(_album.availabilityLabel),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (_album.isInLibrary)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: canAct ? _searchAlbum : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: actionColor,
                        disabledBackgroundColor: actionColor.withValues(alpha: 0.35),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
                        ),
                      ),
                      child: _isSearching
                          ? const BrailleSpinner(fontSize: 14, color: Colors.white)
                          : Text(actionLabel, style: AppTypography.statusBadge),
                    ),
                  ),
                ),
              const SizedBox(height: AppSpacing.sm),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: Text('// TRACKS', style: AppTypography.sectionHeader),
              ),
              Expanded(
                child: tracks.isEmpty
                    ? Center(
                        child: Text(
                          'Nenhuma faixa encontrada.',
                          style: AppTypography.moduleSublabel.copyWith(fontSize: 14),
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        itemCount: tracks.length,
                        separatorBuilder: (_, _) => Divider(
                          color: AppColors.terminalMuted.withValues(alpha: 0.3),
                          height: 1,
                        ),
                        itemBuilder: (context, index) {
                          final track = tracks[index];
                          final color = lidarrStatusColor(track.statusLabel);
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 28,
                                  child: Text(
                                    track.trackNumber.toString().padLeft(2, '0'),
                                    style: AppTypography.moduleSublabel.copyWith(fontSize: 10),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    track.title,
                                    style: AppTypography.moduleLabel.copyWith(fontSize: 12),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  track.statusLabel,
                                  style: AppTypography.statusBadge.copyWith(
                                    fontSize: 8,
                                    color: color,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
