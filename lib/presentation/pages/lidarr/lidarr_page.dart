import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/injection_container.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../domain/entities/lidarr.dart';
import '../../blocs/lidarr_bloc.dart';
import '../../widgets/braille_spinner.dart';
import '../../widgets/tui_input_field.dart';
import '../../widgets/service_scaffold.dart';
import 'artist_albums_page.dart';

class LidarrPage extends StatelessWidget {
  const LidarrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LidarrBloc>()..add(const SearchRequested('')),
      child: const LidarrView(),
    );
  }
}

class LidarrView extends StatefulWidget {
  const LidarrView({super.key});

  @override
  State<LidarrView> createState() => _LidarrViewState();
}

class _LidarrViewState extends State<LidarrView> {
  final TextEditingController _searchController = TextEditingController();

  bool _isFromSearch(LidarrBloc bloc) {
    return bloc.lastLoadWasSearch || _searchController.text.isNotEmpty;
  }

  void _onBackPressed(BuildContext context) {
    final bloc = context.read<LidarrBloc>();
    if (_isFromSearch(bloc)) {
      _searchController.clear();
      bloc.add(const SearchRequested(''));
      return;
    }
    Navigator.pop(context);
  }

  void _openArtist(BuildContext context, LidarrArtist artist) {
    if (artist.isAdded || artist.mbid != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => BlocProvider.value(
            value: context.read<LidarrBloc>(),
            child: ArtistAlbumsPage(artist: artist),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ServiceScaffold(
      serviceName: 'Lidarr',
      themeColor: AppColors.lidarr,
      onLeadingPressed: () => _onBackPressed(context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: TuiInputField(
              controller: _searchController,
              hintText: 'Search artist',
              suffixIcon: IconButton(
                icon: const Icon(Icons.search, color: AppColors.terminalGreen, size: 20),
                onPressed: () {
                  if (_searchController.text.isNotEmpty) {
                    context.read<LidarrBloc>().add(SearchRequested(_searchController.text));
                  }
                },
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  context.read<LidarrBloc>().add(SearchRequested(value));
                }
              },
            ),
          ),
          Expanded(
            child: BlocConsumer<LidarrBloc, LidarrState>(
              listener: (context, state) {
                state.maybeWhen(
                  success: (message) => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(message)),
                  ),
                  error: (message) => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: Colors.redAccent,
                    ),
                  ),
                  orElse: () {},
                );
              },
              builder: (context, state) {
                final bloc = context.read<LidarrBloc>();
                final fromSearch = bloc.lastLoadWasSearch;
                final artists = state.maybeWhen(
                  artistsLoaded: (loadedArtists) => loadedArtists,
                  orElse: () => bloc.lastArtists,
                );
                final isLoading = state is LidarrLoading;

                if (isLoading && artists.isEmpty) {
                  return const Center(child: BrailleSpinner(fontSize: 24, color: AppColors.lidarr));
                }

                if (artists.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.library_music, size: 64, color: AppColors.textMuted),
                        const SizedBox(height: AppSpacing.md),
                        Text(
                          fromSearch
                              ? 'No artists found for this search'
                              : 'Your library is empty. Search for artists to add.',
                          style: AppTypography.moduleSublabel.copyWith(fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }

                return Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            AppSpacing.md,
                            0,
                            AppSpacing.md,
                            AppSpacing.sm,
                          ),
                          child: Text(
                            fromSearch ? '// SEARCH RESULTS' : '// YOUR LIBRARY',
                            style: AppTypography.sectionHeader,
                          ),
                        ),
                        Expanded(child: _buildArtistGrid(context, artists)),
                      ],
                    ),
                    if (isLoading)
                      Container(
                        color: Colors.black.withValues(alpha: 0.5),
                        child: const Center(child: BrailleSpinner(fontSize: 24)),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArtistGrid(BuildContext context, List<LidarrArtist> artists) {
    return GridView.builder(
      padding: const EdgeInsets.all(AppSpacing.sm),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: AppSpacing.sm,
        crossAxisSpacing: AppSpacing.sm,
      ),
      itemCount: artists.length,
      itemBuilder: (context, index) {
        final artist = artists[index];
        return _ArtistCard(
          artist: artist,
          onTap: () => _openArtist(context, artist),
          onAdd: artist.isAdded
              ? null
              : () => context.read<LidarrBloc>().add(ArtistRequested(artist)),
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class _ArtistCard extends StatelessWidget {
  final LidarrArtist artist;
  final VoidCallback onTap;
  final VoidCallback? onAdd;

  const _ArtistCard({
    required this.artist,
    required this.onTap,
    this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
            if (artist.remotePoster != null)
              Image.network(
                artist.remotePoster!,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) =>
                    const Center(child: Icon(Icons.person, size: 48, color: AppColors.textMuted)),
              )
            else
              const Center(child: Icon(Icons.person, size: 48, color: AppColors.textMuted)),
            if (artist.isAdded)
              Positioned(
                top: AppSpacing.xs,
                right: AppSpacing.xs,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppColors.textMuted, width: 0.5),
                  ),
                  child: Text(
                    'LIBRARY',
                    style: AppTypography.statusBadge.copyWith(fontSize: 8, color: Colors.white70),
                  ),
                ),
              ),
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
                      artist.artistName,
                      style: AppTypography.moduleLabel.copyWith(fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (artist.disambiguation != null && artist.disambiguation!.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        artist.disambiguation!,
                        style: AppTypography.moduleSublabel.copyWith(fontSize: 9),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    if (onAdd != null) ...[
                      const SizedBox(height: AppSpacing.xs),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: onAdd,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.lidarr,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(0, 28),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
                            ),
                          ),
                          child: Text('ADD', style: AppTypography.statusBadge),
                        ),
                      ),
                    ],
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
