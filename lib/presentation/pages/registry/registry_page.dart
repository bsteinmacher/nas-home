import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../widgets/service_scaffold.dart';

class NasRegistryPage extends StatelessWidget {
  const NasRegistryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ServiceScaffold(
      serviceName: 'Nas Registry',
      themeColor: AppColors.terminalGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.api_outlined, size: 64, color: AppColors.terminalGreen),
            const SizedBox(height: AppSpacing.md),
            Text('// API_DISCOVERY_CORE', style: AppTypography.moduleLabel),
            const SizedBox(height: AppSpacing.xs),
            Text('STATUS: BROADCASTING_CONFIGS', style: AppTypography.moduleSublabel),
            const SizedBox(height: AppSpacing.xl),
            Text('// COMING_SOON', style: AppTypography.terminalTitle.copyWith(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
