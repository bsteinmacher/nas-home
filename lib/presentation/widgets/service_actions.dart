import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../blocs/nas_status_bloc.dart';
import '../../domain/entities/nas_service.dart';
import 'tui_dialog.dart';

class ServiceUpdateAction extends StatelessWidget {
  final String serviceName;
  final Color color;

  const ServiceUpdateAction({
    super.key,
    required this.serviceName,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NasStatusBloc, NasStatusState>(
      builder: (context, state) {
        final services = state.maybeWhen(
          loaded: (services, _) => services,
          updating: (_, services, _) => services,
          checkingUpdate: (_, services, _) => services,
          orElse: () => <NasService>[],
        );
        
        final service = services.firstWhere(
          (s) => s.name.toLowerCase() == serviceName.toLowerCase(),
          orElse: () => NasService(name: serviceName, port: '', description: ''),
        );

        return IconButton(
          icon: Icon(
            service.updateAvailable ? Icons.system_update_alt : Icons.info_outline,
            color: service.updateAvailable ? Colors.blueAccent : AppColors.textMuted,
            size: 20,
          ),
          onPressed: () => _showUpdateDialog(context, service),
        );
      },
    );
  }

  void _showUpdateDialog(BuildContext context, NasService service) {
    final updateAvailable = service.updateAvailable;
    
    // Versão local amigável ou fallback para Hash curto
    final currentDisplay = service.localVersion ?? 
        (service.localDigest?.substring(0, 12) ?? 'UNKNOWN');
    
    // Informação remota: Tag + Data (mais útil que o Hash remoto)
    String remoteDisplay = 'LATEST_STABLE';
    if (service.remoteLastUpdated != null) {
      try {
        final date = DateTime.parse(service.remoteLastUpdated!);
        remoteDisplay = '${date.day}/${date.month}/${date.year} (RELEASE)';
      } catch (_) {}
    }

    showDialog(
      context: context,
      builder: (dialogContext) => TuiDialog(
        themeColor: color,
        title: '', // Título vazio no cabeçalho como solicitado
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              updateAvailable ? 'NEW_VERSION_FOUND' : 'SERVICE_UP_TO_DATE',
              style: AppTypography.terminalTitle.copyWith(
                color: updateAvailable ? Colors.blueAccent : AppColors.terminalGreen,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              updateAvailable 
                ? 'A new update is available.'
                : 'You are running the latest stable release.',
              style: AppTypography.moduleSublabel.copyWith(fontSize: 11, color: AppColors.textSecondary),
            ),
            if (updateAvailable) ...[
              const SizedBox(height: AppSpacing.md),
              Text('// ACTUAL_VERSION: $currentDisplay', style: AppTypography.moduleSublabel),
              Text('// NEW_RELEASE:    $remoteDisplay', style: AppTypography.moduleSublabel),
              const SizedBox(height: AppSpacing.md),
              Text('Pull new image and restart?', style: AppTypography.moduleSublabel.copyWith(color: AppColors.textSecondary)),
            ],
          ],
        ),
        actions: [
          TuiDialogButton(
            label: 'CLOSE',
            onPressed: () => Navigator.pop(dialogContext),
          ),
          if (updateAvailable) ...[
            const SizedBox(width: AppSpacing.md),
            TuiDialogButton(
              label: 'PROCEED_UPDATE',
              isPrimary: true,
              color: AppColors.terminalGreen,
              onPressed: () {
                Navigator.pop(dialogContext);
                context.read<NasStatusBloc>().add(UpdateServiceRequested(serviceName));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('UPDATE_TASK_QUEUED: $serviceName process started in background.'),
                    backgroundColor: AppColors.terminalGreen.withValues(alpha: 0.8),
                  ),
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}

class ServiceRefreshAction extends StatelessWidget {
  final String serviceName;

  const ServiceRefreshAction({super.key, required this.serviceName});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.refresh, size: 20),
      onPressed: () => context.read<NasStatusBloc>().add(
            CheckServiceUpdateRequested(serviceName),
          ),
      tooltip: 'Check update for $serviceName',
    );
  }
}
