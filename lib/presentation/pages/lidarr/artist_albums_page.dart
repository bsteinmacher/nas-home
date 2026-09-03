import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../domain/entities/lidarr.dart';
import '../../blocs/lidarr_bloc.dart';
import '../../widgets/braille_spinner.dart';
import '../../widgets/service_scaffold.dart';
import 'album_tracks_page.dart';
import 'lidarr_status_style.dart';

class ArtistAlbumsPage extends StatefulWidget {
  final LidarrArtist artist;

  const ArtistAlbumsPage({super.key, required this.artist});

  @override
  State<ArtistAlbumsPage> createState() => _ArtistAlbumsPageState();
}

class _ArtistAlbumsPageState extends State<ArtistAlbumsPage> {
  late LidarrArtist _artist;
  late Future<List<LidarrAlbum>> _albumsFuture;
  bool _isSearchingAll = false;

  @override
  void initState() {
    super.initState();
    _artist = widget.artist;
    _loadAlbums();
  }

  void _loadAlbums() {
    final bloc = context.read<LidarrBloc>();
    final lidarrId = _artist.id;
    final mbid = _artist.mbid;
    if (lidarrId == null && mbid != null) {
      bloc.pendingAlbumsArtistName = _artist.artistName;
    }
    _albumsFuture = bloc.fetchAlbums(lidarrId ?? mbid!);
  }

  Future<void> _refreshAlbums() async {
    setState(_loadAlbums);
    await _albumsFuture;
  }

  Future<void> _downloadDiscography() async {
    final artistId = _artist.id;
    if (artistId == null) return;

    setState(() => _isSearchingAll = true);
    try {
      await context.read<LidarrBloc>().triggerDiscographySearch(artistId);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Busca iniciada para ${_artist.artistName}.'),
          backgroundColor: AppColors.terminalGreen.withValues(alpha: 0.8),
        ),
      );
      await _refreshAlbums();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString().replaceFirst('Exception: ', '')),
          backgroundColor: Colors.redAccent,
        ),
      );
    } finally {
      if (mounted) setState(() => _isSearchingAll = false);
    }
  }

  Future<void> _addArtist() async {
    context.read<LidarrBloc>().add(ArtistRequested(_artist));
  }

  void _openAlbum(LidarrAlbum album) {
    if (!album.isInLibrary || album.id == null) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => BlocProvider.value(
          value: context.read<LidarrBloc>(),
          child: AlbumTracksPage(album: album),
        ),
      ),
    ).then((_) => _refreshAlbums());
  }

  @override
  Widget build(BuildContext context) {
    final isLibrary = _artist.isAdded;

    return BlocListener<LidarrBloc, LidarrState>(
      listener: (context, state) {
        state.maybeWhen(
          artistsLoaded: (artists) {
            LidarrArtist? updated;
            for (final a in artists) {
              if (a.mbid == _artist.mbid) {
                updated = a;
                break;
              }
            }
            if (updated != null && updated.id != _artist.id) {
              setState(() {
                _artist = updated!;
                _loadAlbums();
              });
            }
          },
          orElse: () {},
        );
      },
      child: ServiceScaffold(
      serviceName: 'Lidarr',
      themeColor: AppColors.lidarr,
      body: FutureBuilder<List<LidarrAlbum>>(
        future: _albumsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: BrailleSpinner(fontSize: 24, color: AppColors.lidarr));
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString(), style: AppTypography.moduleLabel));
          }

          final albums = snapshot.data ?? [];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '// ${_artist.artistName.toUpperCase()}',
                      style: AppTypography.sectionHeader,
                    ),
                    if (_artist.disambiguation != null &&
                        _artist.disambiguation!.isNotEmpty) ...[
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        _artist.disambiguation!,
                        style: AppTypography.moduleSublabel.copyWith(fontSize: 11),
                      ),
                    ],
                    const SizedBox(height: AppSpacing.md),
                    if (isLibrary)
                      _ActionBar(
                        label: _isSearchingAll ? 'SEARCHING...' : 'DOWNLOAD_DISCOGRAPHY',
                        onPressed: _isSearchingAll ? null : _downloadDiscography,
                        isLoading: _isSearchingAll,
                      )
                    else
                      _ActionBar(
                        label: 'ADD_ARTIST',
                        onPressed: _addArtist,
                        isPrimary: true,
                      ),
                  ],
                ),
              ),
              if (albums.isEmpty)
                Expanded(
                  child: Center(
                    child: Text(
                      'Nenhum álbum encontrado.',
                      style: AppTypography.moduleSublabel.copyWith(fontSize: 14),
                    ),
                  ),
                )
              else
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: AppSpacing.sm,
                      crossAxisSpacing: AppSpacing.sm,
                    ),
                    itemCount: albums.length,
                    itemBuilder: (context, index) => _AlbumCard(
                      album: albums[index],
                      onTap: () => _openAlbum(albums[index]),
                      onSearch: albums[index].isActionEnabled
                          ? () => _searchAlbum(albums[index])
                          : null,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    ),
    );
  }

  Future<void> _searchAlbum(LidarrAlbum album) async {
    final albumId = album.id;
    if (albumId == null) return;

    try {
      await context.read<LidarrBloc>().triggerAlbumSearch(albumId);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Busca iniciada: ${album.title}'),
          backgroundColor: AppColors.terminalGreen.withValues(alpha: 0.8),
        ),
      );
      setState(_loadAlbums);
      await _albumsFuture;
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString().replaceFirst('Exception: ', '')),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }
}

class _ActionBar extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isPrimary;
  final bool isLoading;

  const _ActionBar({
    required this.label,
    required this.onPressed,
    this.isPrimary = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: isPrimary ? Colors.white : AppColors.terminalGreen,
          backgroundColor: isPrimary ? AppColors.lidarr : Colors.transparent,
          side: BorderSide(
            color: isPrimary ? AppColors.lidarr : AppColors.terminalGreen.withValues(alpha: 0.6),
          ),
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
          ),
        ),
        child: isLoading
            ? const BrailleSpinner(fontSize: 14, color: AppColors.terminalGreen)
            : Text(label, style: AppTypography.statusBadge),
      ),
    );
  }
}

class _AlbumCard extends StatelessWidget {
  final LidarrAlbum album;
  final VoidCallback onTap;
  final VoidCallback? onSearch;

  const _AlbumCard({
    required this.album,
    required this.onTap,
    this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    final actionLabel = album.actionLabel;
    final actionColor = lidarrActionButtonColor(actionLabel);
    final enabled = onSearch != null;

    return InkWell(
      onTap: album.isInLibrary ? onTap : null,
      borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
      child: Card(
        color: AppColors.surface,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (album.remoteCover != null)
              Image.network(
                album.remoteCover!,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) =>
                    const Center(child: Icon(Icons.album, size: 48, color: AppColors.textMuted)),
              )
            else
              const Center(child: Icon(Icons.album, size: 48, color: AppColors.textMuted)),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black87,
                padding: const EdgeInsets.all(AppSpacing.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      album.title,
                      style: AppTypography.moduleLabel.copyWith(fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: enabled ? onSearch : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: actionColor,
                          disabledBackgroundColor: actionColor.withValues(alpha: 0.35),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(0, 28),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
                          ),
                        ),
                        child: Text(actionLabel, style: AppTypography.statusBadge),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
