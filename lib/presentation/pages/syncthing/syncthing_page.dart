import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../widgets/service_scaffold.dart';

class SyncthingPage extends StatelessWidget {
  const SyncthingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ServiceScaffold(
      serviceName: 'Syncthing',
      themeColor: AppColors.syncthing,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.sync_outlined, size: 64, color: AppColors.syncthing),
              const SizedBox(height: AppSpacing.md),
              Text('// P2P_SYNC_MODULE', style: AppTypography.moduleLabel),
              const SizedBox(height: AppSpacing.xs),
              Text('WEB_UI: :8384', style: AppTypography.moduleSublabel),
              const SizedBox(height: AppSpacing.md),
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
                  border: Border.all(color: AppColors.syncthing.withValues(alpha: 0.2)),
                ),
                child: Text(
                  'Syncs music folder to mobile devices. Full API integration planned — use syncthing.home or :8384 for now.',
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
