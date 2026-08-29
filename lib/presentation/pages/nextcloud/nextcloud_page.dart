import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../widgets/service_scaffold.dart';

class NextcloudPage extends StatelessWidget {
  const NextcloudPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ServiceScaffold(
      serviceName: 'Nextcloud',
      themeColor: AppColors.files,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.folder_shared_outlined, size: 64, color: AppColors.textMuted),
              const SizedBox(height: AppSpacing.md),
              Text(
                '// NOT_DEPLOYED',
                style: AppTypography.terminalTitle.copyWith(
                  fontSize: 18,
                  color: AppColors.textMuted,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'This service is not running on the NAS yet.',
                style: AppTypography.moduleSublabel.copyWith(fontSize: 12),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.md),
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
                  border: Border.all(color: AppColors.textMuted.withValues(alpha: 0.2)),
                ),
                child: Text(
                  'PLANNED: Deploy Nextcloud on the NAS in a future phase, then enable this module in the app.',
                  style: AppTypography.moduleSublabel.copyWith(fontSize: 11),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
