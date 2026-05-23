import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../widgets/service_scaffold.dart';

class NavidromePage extends StatelessWidget {
  const NavidromePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ServiceScaffold(
      serviceName: 'Navidrome',
      themeColor: AppColors.lidarr,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.music_note_outlined, size: 64, color: AppColors.lidarr),
            const SizedBox(height: AppSpacing.md),
            Text('// MUSIC_STREAMING_CORE', style: AppTypography.moduleLabel),
            const SizedBox(height: AppSpacing.xs),
            Text('STATUS: INDEXING_LIBRARY...', style: AppTypography.moduleSublabel),
            const SizedBox(height: AppSpacing.xl),
            Text('// COMING_SOON', style: AppTypography.terminalTitle.copyWith(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
