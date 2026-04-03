import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/di/injection_container.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../blocs/lidarr_bloc.dart';
import '../widgets/tui_input_field.dart';

class LidarrPage extends StatelessWidget {
  const LidarrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LidarrBloc>(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LIDARR_REQUEST',
          style: AppTypography.terminalTitle.copyWith(color: AppColors.lidarr),
        ),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop(context),
        ),
      ),
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
                  context.read<LidarrBloc>().add(SearchRequested(_searchController.text));
                },
              ),
              onSubmitted: (value) {
                context.read<LidarrBloc>().add(SearchRequested(value));
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
                      content: Text('Error: $message'),
                      backgroundColor: Colors.redAccent,
                    ),
                  ),
                  orElse: () {},
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  artistsLoaded: (artists) => ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                    itemCount: artists.length,
                    itemBuilder: (context, index) {
                      final artist = artists[index];
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                          vertical: AppSpacing.xs,
                        ),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
                          child: artist.remotePoster != null
                              ? Image.network(
                                  artist.remotePoster!,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => const Icon(Icons.person, color: AppColors.textMuted),
                                )
                              : const Icon(Icons.person, color: AppColors.textMuted),
                        ),
                        title: Text(
                          artist.artistName,
                          style: AppTypography.moduleLabel,
                        ),
                        subtitle: Text(
                          artist.status ?? 'Unknown Status',
                          style: AppTypography.moduleSublabel,
                        ),
                        trailing: artist.isAdded
                            ? const Icon(Icons.check_circle, color: AppColors.terminalGreen)
                            : ElevatedButton(
                                onPressed: () {
                                  context.read<LidarrBloc>().add(ArtistRequested(artist));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.lidarr,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
                                  ),
                                ),
                                child: Text('ADD', style: AppTypography.statusBadge),
                              ),
                        onTap: artist.isAdded && artist.id != null
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (ctx) => BlocProvider.value(
                                      value: context.read<LidarrBloc>(),
                                      child: AlbumsView(artistId: artist.id!, artistName: artist.artistName),
                                    ),
                                  ),
                                );
                              }
                            : null,
                      );
                    },
                  ),
                  initial: () => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.library_music, size: 64, color: AppColors.textMuted),
                        const SizedBox(height: AppSpacing.md),
                        Text(
                          'Search for artists to add to your library',
                          style: AppTypography.moduleSublabel.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AlbumsView extends StatefulWidget {
  final String artistId;
  final String artistName;

  const AlbumsView({super.key, required this.artistId, required this.artistName});

  @override
  State<AlbumsView> createState() => _AlbumsViewState();
}

class _AlbumsViewState extends State<AlbumsView> {
  @override
  void initState() {
    super.initState();
    context.read<LidarrBloc>().add(AlbumsRequested(widget.artistId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ALBUMS: ${widget.artistName.toUpperCase()}',
          style: AppTypography.terminalTitle.copyWith(fontSize: 14),
        ),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocBuilder<LidarrBloc, LidarrState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            albumsLoaded: (albums) => GridView.builder(
              padding: const EdgeInsets.all(AppSpacing.sm),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                mainAxisSpacing: AppSpacing.sm,
                crossAxisSpacing: AppSpacing.sm,
              ),
              itemCount: albums.length,
              itemBuilder: (context, index) {
                final album = albums[index];
                return Card(
                  color: AppColors.surface,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: album.remoteCover != null
                            ? Image.network(
                                album.remoteCover!,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => const Icon(Icons.album, size: 48, color: AppColors.textMuted),
                              )
                            : const Icon(Icons.album, size: 48, color: AppColors.textMuted),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(AppSpacing.sm),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              album.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTypography.moduleLabel.copyWith(fontSize: 12),
                            ),
                            Text(
                              album.releaseDate ?? 'Unknown date',
                              style: AppTypography.moduleSublabel,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            error: (message) => Center(
              child: Text(message, style: AppTypography.moduleLabel),
            ),
            orElse: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
