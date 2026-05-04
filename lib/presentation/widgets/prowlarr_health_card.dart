import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../blocs/prowlarr_bloc.dart';

class ProwlarrHealthCard extends StatelessWidget {
  const ProwlarrHealthCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProwlarrBloc, ProwlarrState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (indexers) {
            final issues = indexers.where((i) => i.status != 'ok').toList();
            if (issues.isEmpty) {
              return const SizedBox.shrink();
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.lg),
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
                  border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.warning_amber_rounded, color: AppColors.error, size: 20),
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          'INDEXER_HEALTH_WARNING',
                          style: AppTypography.moduleLabel.copyWith(color: AppColors.error),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    ...issues.map((i) => Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                      child: Text(
                        '> ${i.name.toUpperCase()}: ${i.status.toUpperCase()}',
                        style: AppTypography.terminalBody.copyWith(
                          color: AppColors.error.withValues(alpha: 0.8),
                          fontSize: 12,
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
