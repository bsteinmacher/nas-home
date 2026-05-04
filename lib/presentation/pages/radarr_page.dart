import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/di/injection_container.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../blocs/radarr_bloc.dart';
import '../../domain/entities/radarr.dart';

class RadarrPage extends StatelessWidget {
  const RadarrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<RadarrBloc>()..add(const FetchMovies()),
      child: const RadarrView(),
    );
  }
}

class RadarrView extends StatelessWidget {
  const RadarrView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'RADARR_MONITOR',
          style: AppTypography.terminalTitle.copyWith(color: AppColors.radarr),
        ),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<RadarrBloc>().add(const FetchMovies()),
          ),
        ],
      ),
      body: BlocBuilder<RadarrBloc, RadarrState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(
              child: CircularProgressIndicator(color: AppColors.radarr),
            ),
            error: (message) => Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Text(
                  'ERROR: $message',
                  textAlign: TextAlign.center,
                  style: AppTypography.moduleLabel.copyWith(color: Colors.redAccent),
                ),
              ),
            ),
            loaded: (movies, queue) => _buildContent(context, movies, queue),
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, List<RadarrMovie> movies, List<dynamic> queue) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            indicatorColor: AppColors.radarr,
            labelStyle: AppTypography.statusBadge,
            tabs: [
              Tab(text: 'LIBRARY (${movies.length})'),
              Tab(text: 'QUEUE (${queue.length})'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildMovieList(movies),
                _buildQueueList(queue),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieList(List<RadarrMovie> movies) {
    if (movies.isEmpty) {
      return Center(
        child: Text('NO MOVIES FOUND', style: AppTypography.moduleSublabel),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.md),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return Card(
          color: AppColors.surface,
          margin: const EdgeInsets.only(bottom: AppSpacing.sm),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
            side: BorderSide(
              color: movie.monitored ? AppColors.radarr.withOpacity(0.3) : Colors.transparent,
            ),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.xs),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: movie.remotePoster != null
                  ? Image.network(
                      movie.remotePoster!,
                      width: 40,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(Icons.movie, color: AppColors.textMuted),
                    )
                  : const Icon(Icons.movie, color: AppColors.textMuted),
            ),
            title: Text(
              movie.title.toUpperCase(),
              style: AppTypography.moduleLabel,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              '${movie.year} • ${movie.status.toUpperCase()}',
              style: AppTypography.moduleSublabel,
            ),
            trailing: movie.monitored
                ? const Icon(Icons.bookmark, color: AppColors.radarr, size: 16)
                : null,
          ),
        );
      },
    );
  }

  Widget _buildQueueList(List<dynamic> queue) {
    if (queue.isEmpty) {
      return Center(
        child: Text('QUEUE EMPTY', style: AppTypography.moduleSublabel),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.md),
      itemCount: queue.length,
      itemBuilder: (context, index) {
        final item = queue[index];
        // Assuming queue item has 'title' and 'status' - based on Radarr API
        final String title = item['title'] ?? 'Unknown Movie';
        final String status = item['status'] ?? 'Unknown Status';
        final String timeLeft = item['timeleft'] ?? '';

        return Card(
          color: AppColors.surface,
          margin: const EdgeInsets.only(bottom: AppSpacing.sm),
          child: ListTile(
            title: Text(title.toUpperCase(), style: AppTypography.moduleLabel),
            subtitle: Text(
              '${status.toUpperCase()} ${timeLeft.isNotEmpty ? "• $timeLeft" : ""}',
              style: AppTypography.moduleSublabel,
            ),
            trailing: const Icon(Icons.download, color: AppColors.download, size: 16),
          ),
        );
      },
    );
  }
}
