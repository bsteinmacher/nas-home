import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/di/injection_container.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../blocs/media_bloc.dart';
import '../widgets/tui_input_field.dart';

class MediaPage extends StatelessWidget {
  const MediaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MediaBloc>()..add(const TrendingRequested()),
      child: const MediaView(),
    );
  }
}

class MediaView extends StatefulWidget {
  const MediaView({super.key});

  @override
  State<MediaView> createState() => _MediaViewState();
}

class _MediaViewState extends State<MediaView> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MEDIA_REQUEST',
          style: AppTypography.terminalTitle.copyWith(color: AppColors.media),
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
              hintText: 'Search movies or shows',
              suffixIcon: IconButton(
                icon: const Icon(Icons.search, color: AppColors.terminalGreen, size: 20),
                onPressed: () {
                  if (_searchController.text.isNotEmpty) {
                    context.read<MediaBloc>().add(SearchRequested(_searchController.text));
                  }
                },
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  context.read<MediaBloc>().add(SearchRequested(value));
                }
              },
            ),
          ),
          Expanded(
            child: BlocConsumer<MediaBloc, MediaState>(
              listener: (context, state) {
                state.whenOrNull(
                  requestSuccess: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Request sent successfully!')),
                    );
                  },
                  error: (message) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error: $message'),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  loaded: (mediaList) => GridView.builder(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: AppSpacing.sm,
                      crossAxisSpacing: AppSpacing.sm,
                    ),
                    itemCount: mediaList.length,
                    itemBuilder: (context, index) {
                      final media = mediaList[index];
                      return _buildMediaCard(context, media);
                    },
                  ),
                  error: (message) => Center(
                    child: Text(message, style: AppTypography.moduleLabel),
                  ),
                  orElse: () => Center(
                    child: Text(
                      'Search for titles or check trending',
                      style: AppTypography.moduleSublabel.copyWith(fontSize: 14),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMediaCard(BuildContext context, dynamic media) {
    final posterUrl = media.posterPath != null
        ? 'https://image.tmdb.org/t/p/w500${media.posterPath}'
        : null;

    return Card(
      color: AppColors.surface,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (posterUrl != null)
            Image.network(
              posterUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const Center(child: Icon(Icons.broken_image)),
            )
          else
            const Center(child: Icon(Icons.movie, size: 48, color: AppColors.textMuted)),
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
                    media.title,
                    style: AppTypography.moduleLabel.copyWith(fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<MediaBloc>().add(RequestMedia(media.id, media.mediaType));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.media,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 28),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
                        ),
                      ),
                      child: Text('REQUEST', style: AppTypography.statusBadge),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
