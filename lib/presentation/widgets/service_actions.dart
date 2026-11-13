import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../blocs/nas_status_bloc.dart';
import '../../domain/entities/nas_service.dart';
import 'tui_dialog.dart';
import 'tui_toast.dart';

String localVersionLabel(NasService service) {
  return service.localVersion ??
      (service.localDigest != null && service.localDigest!.length >= 12
          ? service.localDigest!.substring(0, 12)
          : 'UNKNOWN');
}

String remoteVersionLabel(NasService service) {
  var remote = 'TAG: ${service.imageTag ?? 'latest'}';
  final remoteDigest = service.remoteDigest;
  if (remoteDigest != null && remoteDigest.length >= 12) {
    remote += ' @${remoteDigest.substring(0, 11)}';
  }
  return remote;
}

void showServiceUpdateDialog(
  BuildContext context,
  NasService service,
  Color color,
) {
  final updateAvailable = service.updateAvailable;
  final currentDisplay = localVersionLabel(service);
  final remoteDisplay = remoteVersionLabel(service);

  showDialog(
    context: context,
    builder: (dialogContext) => TuiDialog(
      themeColor: color,
      title: service.name,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            updateAvailable ? 'NEW_VERSION_FOUND' : 'SERVICE_UP_TO_DATE',
            style: AppTypography.title.copyWith(
              color: updateAvailable ? AppColors.update : AppColors.terminalGreen,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            updateAvailable
                ? 'Uma versão nova está disponível.'
                : 'Este serviço já está na versão mais recente.',
            style: AppTypography.body.copyWith(color: AppColors.textSecondary),
          ),
          if (updateAvailable) ...[
            const SizedBox(height: AppSpacing.md),
            Text(
              '// ACTUAL_VERSION: $currentDisplay',
              style: AppTypography.caption,
            ),
            Text(
              '// NEW_RELEASE:    $remoteDisplay',
              style: AppTypography.caption,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Baixar a imagem nova e reiniciar este serviço?',
              style: AppTypography.body.copyWith(color: AppColors.textSecondary),
            ),
          ],
        ],
      ),
      actions: [
        TuiDialogButton(
          label: 'CANCEL',
          onPressed: () => Navigator.pop(dialogContext),
        ),
        if (updateAvailable) ...[
          const SizedBox(width: AppSpacing.md),
          TuiDialogButton(
            label: 'UPDATE_NOW',
            isPrimary: true,
            color: AppColors.terminalGreen,
            onPressed: () {
              Navigator.pop(dialogContext);
              context.read<NasStatusBloc>().add(UpdateServiceRequested(service.name));
              TuiToast.show(
                context,
                'Atualização de ${service.name} iniciada. O serviço reinicia em seguida.',
                kind: TuiToastKind.info,
              );
            },
          ),
        ],
      ],
    ),
  );
}

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

        final service = services.cast<NasService?>().firstWhere(
              (s) => s!.name.toLowerCase() == serviceName.toLowerCase(),
              orElse: () => null,
            );

        if (service == null || !service.updateAvailable) {
          return const SizedBox.shrink();
        }

        return IconButton(
          icon: const Icon(Icons.system_update_alt, color: AppColors.update),
          tooltip: 'Atualizar ${service.name}',
          onPressed: () => showServiceUpdateDialog(context, service, color),
        );
      },
    );
  }
}

class ServiceRefreshAction extends StatelessWidget {
  final String serviceName;

  const ServiceRefreshAction({super.key, required this.serviceName});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.refresh),
      onPressed: () => context.read<NasStatusBloc>().add(
            CheckServiceUpdateRequested(serviceName),
          ),
      tooltip: 'Verificar atualização de $serviceName',
    );
  }
}
