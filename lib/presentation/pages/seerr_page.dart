import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/di/injection_container.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../../domain/entities/seerr.dart';
import '../blocs/seerr_bloc.dart';
import '../widgets/tui_input_field.dart';

class SeerrPage extends StatelessWidget {
  const SeerrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SeerrBloc>()..add(const TrendingRequested()),
      child: const SeerrView(),
    );
  }
}

class SeerrView extends StatefulWidget {
  const SeerrView({super.key});

  @override
  State<SeerrView> createState() => _SeerrViewState();
}

class _SeerrViewState extends State<SeerrView> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SEERR_REQUEST',
          style: AppTypography.terminalTitle.copyWith(color: AppColors.seerr),
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
                    context.read<SeerrBloc>().add(SearchRequested(_searchController.text));
                  }
                },
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  context.read<SeerrBloc>().add(SearchRequested(value));
                }
              },
            ),
          ),
          Expanded(
            child: BlocConsumer<SeerrBloc, SeerrState>(
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
                  loaded: (seerrList) => GridView.builder(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: AppSpacing.sm,
                      crossAxisSpacing: AppSpacing.sm,
                    ),
                    itemCount: seerrList.length,
                    itemBuilder: (context, index) {
                      final item = seerrList[index];
                      return _buildMediaCard(context, item);
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

  Widget _buildMediaCard(BuildContext context, Seerr media) {
    final posterUrl = media.posterPath != null
        ? 'https://image.tmdb.org/t/p/w500${media.posterPath}'
        : null;

    final status = media.status;
    final isRequested = media.isRequested;
    final mediaType = media.mediaType;

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

          // Type Pill (Top Right)
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
                mediaType.toUpperCase(),
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
                    media.title,
                    style: AppTypography.moduleLabel.copyWith(fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isRequested ? null : () {
                        context.read<SeerrBloc>().add(RequestSeerr(media.id, mediaType));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _getButtonColor(status),
                        disabledBackgroundColor: _getButtonColor(status).withValues(alpha: 0.3),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 28),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
                        ),
                      ),
                      child: Text(_getButtonText(status), style: AppTypography.statusBadge),
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

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
