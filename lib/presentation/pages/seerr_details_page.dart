import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../../domain/entities/seerr.dart';
import '../blocs/seerr_bloc.dart';

class SeerrDetailsPage extends StatelessWidget {
  final Seerr media;

  const SeerrDetailsPage({super.key, required this.media});

  @override
  Widget build(BuildContext context) {
    final posterUrl = media.posterPath != null
        ? 'https://image.tmdb.org/t/p/w500${media.posterPath}'
        : null;

    final mediaType = media.mediaType;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          media.title.toUpperCase(),
          style: AppTypography.terminalTitle.copyWith(color: AppColors.seerr),
        ),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
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
                              errorBuilder: (_, __, ___) => const Center(child: Icon(Icons.broken_image)),
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
                      _infoRow('TYPE', mediaType.toUpperCase()),
                      const SizedBox(height: AppSpacing.sm),
                      _infoRow('RELEASE', _formatDate(media.releaseDate)),
                      const SizedBox(height: AppSpacing.lg),
                      // Action Button
                      _buildRequestButton(context),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
            // Title Header
            Text(
              '// TITLE',
              style: AppTypography.sectionHeader,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              media.title.toUpperCase(),
              style: AppTypography.moduleLabel.copyWith(fontSize: 18),
            ),
            const SizedBox(height: AppSpacing.lg),
            // Overview Header
            Text(
              '// OVERVIEW',
              style: AppTypography.sectionHeader,
            ),
            const SizedBox(height: AppSpacing.sm),
            // Overview Text
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

  Widget _buildRequestButton(BuildContext context) {
    final isRequested = media.isRequested;
    final status = media.status;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isRequested ? null : () {
          context.read<SeerrBloc>().add(RequestSeerr(media.id, media.mediaType));
          // Note: We might want to pop back after request or show a message.
          // The SeerrBloc already handles showing a snackbar in the previous page.
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: _getButtonColor(status),
          disabledBackgroundColor: _getButtonColor(status).withValues(alpha: 0.3),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
          ),
          side: BorderSide(color: Colors.white24, width: 0.5),
        ),
        child: Text(
          _getButtonText(status),
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
