import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../domain/entities/seerr.dart';
import '../../blocs/seerr_bloc.dart';

class SeerrDetailsPage extends StatefulWidget {
  final Seerr media;

  const SeerrDetailsPage({super.key, required this.media});

  @override
  State<SeerrDetailsPage> createState() => _SeerrDetailsPageState();
}

class _SeerrDetailsPageState extends State<SeerrDetailsPage> {
  final Set<int> _selectedSeasons = {};

  @override
  void initState() {
    super.initState();
    context.read<SeerrBloc>().add(DetailsRequested(widget.media.id, widget.media.mediaType));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeerrBloc, SeerrState>(
      builder: (context, state) {
        final currentMedia = state.maybeWhen(
          detailsLoaded: (m) => m,
          orElse: () => widget.media,
        );

        final posterUrl = currentMedia.posterPath != null
            ? 'https://image.tmdb.org/t/p/w500${currentMedia.posterPath}'
            : null;

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            title: Text(
              currentMedia.title.toUpperCase(),
              style: AppTypography.terminalTitle.copyWith(color: AppColors.seerr),
            ),
            leading: IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator(color: AppColors.seerr)),
            error: (message) => Center(child: Text(message, style: AppTypography.moduleLabel)),
            orElse: () => _buildContent(context, currentMedia, posterUrl),
          ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, Seerr media, String? posterUrl) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Poster and Info Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Poster
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
                    border: Border.all(color: AppColors.textMuted, width: 0.5),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: AspectRatio(
                    aspectRatio: 2 / 3,
                    child: posterUrl != null
                        ? Image.network(
                            posterUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) => const Center(child: Icon(Icons.broken_image)),
                          )
                        : const Center(child: Icon(Icons.movie, size: 48, color: AppColors.textMuted)),
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              // Quick Info
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _infoRow('TYPE', media.mediaType.toUpperCase()),
                    const SizedBox(height: AppSpacing.sm),
                    _infoRow('RELEASE', _formatDate(media.releaseDate)),
                    const SizedBox(height: AppSpacing.lg),
                    // Action Button
                    _buildRequestButton(context, media),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          
          if (media.mediaType == 'tv' && media.seasons != null && media.seasons!.isNotEmpty) ...[
            Text('// SEASONS', style: AppTypography.sectionHeader),
            const SizedBox(height: AppSpacing.sm),
            _buildSeasonsList(media.seasons!),
            const SizedBox(height: AppSpacing.xl),
          ],

          // Overview Header
          Text('// OVERVIEW', style: AppTypography.sectionHeader),
          const SizedBox(height: AppSpacing.sm),
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
              border: Border.all(color: AppColors.terminalMuted, width: 0.5),
            ),
            child: Text(
              media.overview ?? 'No overview available.',
              style: AppTypography.moduleSublabel.copyWith(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeasonsList(List<SeerrSeason> seasons) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
        border: Border.all(color: AppColors.terminalMuted, width: 0.5),
      ),
      child: Column(
        children: seasons.map((season) {
          final isSelected = _selectedSeasons.contains(season.seasonNumber);
          return CheckboxListTile(
            title: Text(
              'SEASON ${season.seasonNumber}',
              style: AppTypography.moduleLabel.copyWith(fontSize: 14),
            ),
            subtitle: Text(
              '${season.episodeCount} EPISODES',
              style: AppTypography.moduleSublabel.copyWith(fontSize: 10),
            ),
            value: isSelected,
            activeColor: AppColors.seerr,
            checkColor: Colors.white,
            onChanged: (bool? value) {
              setState(() {
                if (value == true) {
                  _selectedSeasons.add(season.seasonNumber);
                } else {
                  _selectedSeasons.remove(season.seasonNumber);
                }
              });
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.sectionHeader.copyWith(fontSize: 8),
        ),
        Text(
          value,
          style: AppTypography.moduleLabel.copyWith(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildRequestButton(BuildContext context, Seerr media) {
    final isRequested = media.isRequested;
    final status = media.status;
    final isTv = media.mediaType == 'tv';
    final canRequest = !isRequested && (!isTv || _selectedSeasons.isNotEmpty);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: canRequest ? () {
          context.read<SeerrBloc>().add(RequestSeerr(
            media.id, 
            media.mediaType,
            seasons: isTv ? _selectedSeasons.toList() : null,
          ));
        } : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: _getButtonColor(status),
          disabledBackgroundColor: _getButtonColor(status).withValues(alpha: 0.3),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
          ),
          side: const BorderSide(color: Colors.white24, width: 0.5),
        ),
        child: Text(
          isRequested ? _getButtonText(status) : (isTv && _selectedSeasons.isEmpty ? 'SELECT SEASONS' : 'REQUEST'),
          style: AppTypography.statusBadge.copyWith(fontSize: 12),
        ),
      ),
    );
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return 'N/A';
    try {
      final parts = dateStr.split('-');
      if (parts.length < 2) return dateStr;
      
      final year = parts[0];
      final monthInt = int.parse(parts[1]);
      
      final months = [
        'January', 'February', 'March', 'April', 'May', 'June',
        'July', 'August', 'September', 'October', 'November', 'December'
      ];
      
      if (monthInt < 1 || monthInt > 12) return dateStr;
      
      return '${months[monthInt - 1]}, $year';
    } catch (e) {
      return dateStr;
    }
  }

  String _getButtonText(int? status) {
    switch (status) {
      case 2: return 'PENDING';
      case 3: return 'PROCESSING';
      case 4: return 'PARTIAL';
      case 5: return 'AVAILABLE';
      default: return 'REQUEST';
    }
  }

  Color _getButtonColor(int? status) {
    switch (status) {
      case 4:
      case 5:
        return Colors.greenAccent.withValues(alpha: 0.8);
      case 2:
      case 3:
        return Colors.orangeAccent.withValues(alpha: 0.8);
      default:
        return AppColors.seerr;
    }
  }
}
