import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../widgets/service_scaffold.dart';

class HeadscalePage extends StatelessWidget {
  const HeadscalePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ServiceScaffold(
      serviceName: 'Headscale',
      themeColor: AppColors.networking,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.vpn_lock_outlined, size: 64, color: AppColors.networking),
            const SizedBox(height: AppSpacing.md),
            Text('// VPN_CONTROL_PLANE', style: AppTypography.moduleLabel),
            const SizedBox(height: AppSpacing.xs),
            Text('STATUS: MESH_NETWORK_READY', style: AppTypography.moduleSublabel),
            const SizedBox(height: AppSpacing.xl),
            Text('// COMING_SOON', style: AppTypography.terminalTitle.copyWith(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
