import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/di/injection_container.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../blocs/music_bloc.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MusicBloc>(),
      child: const MusicView(),
    );
  }
}

class MusicView extends StatefulWidget {
  const MusicView({super.key});

  @override
  State<MusicView> createState() => _MusicViewState();
}

class _MusicViewState extends State<MusicView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MUSIC_REQUEST',
          style: AppTypography.terminalTitle.copyWith(color: AppColors.music),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: TextField(
              controller: _searchController,
              style: AppTypography.baseStyle,
              decoration: InputDecoration(
                hintText: 'Search artist...',
                hintStyle: AppTypography.moduleSublabel.copyWith(fontSize: 14),
                prefixIcon: const Icon(Icons.search, color: AppColors.textMuted),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send, color: AppColors.terminalGreen),
                  onPressed: () {
                    context.read<MusicBloc>().add(SearchRequested(_searchController.text));
                  },
                ),
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.terminalGreen),
                ),
              ),
              onSubmitted: (value) {
                context.read<MusicBloc>().add(SearchRequested(value));
              },
            ),
          ),
          Expanded(
            child: BlocConsumer<MusicBloc, MusicState>(
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
                                  context.read<MusicBloc>().add(ArtistRequested(artist));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.music,
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
                                      value: context.read<MusicBloc>(),
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
    context.read<MusicBloc>().add(AlbumsRequested(widget.artistId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ALBUMS: ${widget.artistName.toUpperCase()}',
          style: AppTypography.terminalTitle.copyWith(fontSize: 14),
        ),
      ),
      body: BlocBuilder<MusicBloc, MusicState>(
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
