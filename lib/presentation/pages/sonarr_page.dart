import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/di/injection_container.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../blocs/sonarr_bloc.dart';
import '../../domain/entities/sonarr.dart';

class SonarrPage extends StatelessWidget {
  const SonarrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SonarrBloc>()..add(const FetchSeries()),
      child: const SonarrView(),
    );
  }
}

class SonarrView extends StatelessWidget {
  const SonarrView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SONARR_MONITOR',
          style: AppTypography.terminalTitle.copyWith(color: AppColors.sonarr),
        ),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<SonarrBloc>().add(const FetchSeries()),
          ),
        ],
      ),
      body: BlocBuilder<SonarrBloc, SonarrState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(
              child: CircularProgressIndicator(color: AppColors.sonarr),
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
            loaded: (series, queue) => _buildContent(context, series, queue),
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, List<SonarrSeries> series, List<dynamic> queue) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            indicatorColor: AppColors.sonarr,
            labelStyle: AppTypography.statusBadge,
            tabs: [
              Tab(text: 'SERIES (${series.length})'),
              Tab(text: 'QUEUE (${queue.length})'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildSeriesList(series),
                _buildQueueList(queue),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeriesList(List<SonarrSeries> series) {
    if (series.isEmpty) {
      return Center(
        child: Text('NO SERIES FOUND', style: AppTypography.moduleSublabel),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.md),
      itemCount: series.length,
      itemBuilder: (context, index) {
        final item = series[index];
        return Card(
          color: AppColors.surface,
          margin: const EdgeInsets.only(bottom: AppSpacing.sm),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
            side: BorderSide(
              color: item.monitored ? AppColors.sonarr.withValues(alpha: 0.3) : Colors.transparent,
            ),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.xs),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: item.remotePoster != null
                  ? Image.network(
                      item.remotePoster!,
                      width: 40,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(Icons.tv, color: AppColors.textMuted),
                    )
                  : const Icon(Icons.tv, color: AppColors.textMuted),
            ),
            title: Text(
              item.title.toUpperCase(),
              style: AppTypography.moduleLabel,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              '${item.year} • ${item.seasonCount} SEASONS • ${item.status.toUpperCase()}',
              style: AppTypography.moduleSublabel,
            ),
            trailing: item.monitored
                ? const Icon(Icons.bookmark, color: AppColors.sonarr, size: 16)
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
        final String title = item['title'] ?? 'Unknown Series';
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
