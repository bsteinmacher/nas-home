import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../widgets/service_scaffold.dart';

class SonarrPage extends StatelessWidget {
  const SonarrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ServiceScaffold(
      serviceName: 'Sonarr',
      themeColor: AppColors.sonarr,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.tv_outlined, size: 64, color: AppColors.sonarr),
            const SizedBox(height: AppSpacing.md),
            Text('// TV_SHOWS_AUTOMATION_MODULE', style: AppTypography.moduleLabel),
            const SizedBox(height: AppSpacing.xs),
            Text('STATUS: LOADING_DATABASE...', style: AppTypography.moduleSublabel),
            const SizedBox(height: AppSpacing.xl),
            Text('// COMING_SOON', style: AppTypography.terminalTitle.copyWith(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
