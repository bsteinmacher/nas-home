import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../domain/entities/nas_service.dart';
import '../../blocs/nas_status_bloc.dart';
import '../../service_catalog.dart';
import '../../widgets/braille_spinner.dart';
import '../../widgets/service_actions.dart';

Future<void> showServiceInfoSheet(BuildContext context, NasService service) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.surface,
    builder: (sheetContext) => BlocProvider.value(
      value: context.read<NasStatusBloc>(),
      child: ServiceInfoSheet(serviceName: service.name, fallback: service),
    ),
  );
}

class ServiceInfoSheet extends StatelessWidget {
  final String serviceName;
  final NasService fallback;

  const ServiceInfoSheet({
    super.key,
    required this.serviceName,
    required this.fallback,
  });

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    return BlocBuilder<NasStatusBloc, NasStatusState>(
      builder: (context, state) {
        final services = state.maybeWhen(
          loaded: (services, _) => services,
          updating: (_, services, _) => services,
          checkingUpdate: (_, services, _) => services,
          orElse: () => <NasService>[fallback],
        );
        final service = services.cast<NasService?>().firstWhere(
              (item) => item!.name.toLowerCase() == serviceName.toLowerCase(),
              orElse: () => fallback,
            )!;
        final meta = serviceMetaFor(service.name);
        final checking = state.maybeWhen(
          checkingUpdate: (name, _, _) => name.toLowerCase() == serviceName.toLowerCase(),
          orElse: () => false,
        );
        final updating = state.maybeWhen(
          updating: (name, _, _) => name.toLowerCase() == serviceName.toLowerCase(),
          orElse: () => false,
        );

        final status = !service.isDeployed
            ? 'NOT_DEPLOYED'
            : service.isOnline
                ? 'ONLINE'
                : 'OFFLINE';
        final statusColor = !service.isDeployed
            ? AppColors.textMuted
            : service.isOnline
                ? AppColors.terminalGreen
                : AppColors.offline;

        return Padding(
          padding: EdgeInsets.fromLTRB(
            AppSpacing.md,
            AppSpacing.md,
            AppSpacing.md,
            AppSpacing.md + bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(meta.icon, color: meta.color, size: 28),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(meta.label, style: AppTypography.cardTitle),
                  ),
                  Text(
                    status,
                    style: AppTypography.micro.copyWith(color: statusColor),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(meta.description, style: AppTypography.caption),
              const SizedBox(height: AppSpacing.md),
              Text('PORT ${service.port.isEmpty ? '—' : service.port}', style: AppTypography.caption),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'LOCAL ${localVersionLabel(service)}',
                style: AppTypography.caption,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'REMOTE ${remoteVersionLabel(service)}',
                style: AppTypography.caption,
              ),
              const SizedBox(height: AppSpacing.lg),
              if (checking || updating)
                const Padding(
                  padding: EdgeInsets.only(bottom: AppSpacing.md),
                  child: Row(
                    children: [
                      BrailleSpinner(fontSize: 16),
                      SizedBox(width: AppSpacing.sm),
                      Text('WORKING'),
                    ],
                  ),
                ),
              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: [
                  if (service.isDeployed)
                    _SheetButton(
                      label: 'CHECK_UPDATE',
                      onPressed: checking || updating
                          ? null
                          : () => context.read<NasStatusBloc>().add(
                                CheckServiceUpdateRequested(service.name),
                              ),
                    ),
                  if (service.isDeployed && service.updateAvailable)
                    _SheetButton(
                      label: 'UPDATE',
                      filled: true,
                      onPressed: updating
                          ? null
                          : () => showServiceUpdateDialog(context, service, meta.color),
                    ),
                  if (meta.page != null)
                    _SheetButton(
                      label: 'OPEN_MODULE',
                      filled: true,
                      color: meta.color,
                      onPressed: () {
                        final page = meta.page!;
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: page),
                        );
                      },
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SheetButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool filled;
  final Color? color;

  const _SheetButton({
    required this.label,
    required this.onPressed,
    this.filled = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final accent = color ?? AppColors.terminalGreen;
    final style = filled
        ? FilledButton.styleFrom(
            backgroundColor: accent,
            foregroundColor: Colors.black,
            minimumSize: const Size(44, 44),
            textStyle: AppTypography.micro,
          )
        : OutlinedButton.styleFrom(
            foregroundColor: AppColors.textPrimary,
            side: const BorderSide(color: AppColors.borderSubtle),
            minimumSize: const Size(44, 44),
            textStyle: AppTypography.micro,
          );
    final child = Text(label, style: AppTypography.micro.copyWith(
      color: filled ? Colors.black : AppColors.textPrimary,
    ));
    if (filled) {
      return FilledButton(onPressed: onPressed, style: style, child: child);
    }
    return OutlinedButton(onPressed: onPressed, style: style, child: child);
  }
}
