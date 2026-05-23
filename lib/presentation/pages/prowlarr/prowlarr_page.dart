import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../widgets/service_scaffold.dart';

class ProwlarrPage extends StatelessWidget {
  const ProwlarrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ServiceScaffold(
      serviceName: 'Prowlarr',
      themeColor: AppColors.prowlarr,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.search_outlined, size: 64, color: AppColors.prowlarr),
            const SizedBox(height: AppSpacing.md),
            Text('// INDEXER_PROXY_MODULE', style: AppTypography.moduleLabel),
            const SizedBox(height: AppSpacing.xs),
            Text('STATUS: SYNCING_INDEXERS...', style: AppTypography.moduleSublabel),
            const SizedBox(height: AppSpacing.xl),
            Text('// COMING_SOON', style: AppTypography.terminalTitle.copyWith(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
