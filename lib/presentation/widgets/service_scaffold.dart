import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../blocs/nas_status_bloc.dart';
import 'braille_spinner.dart';
import 'tui_app_bar.dart';
import 'service_actions.dart';

class ServiceScaffold extends StatelessWidget {
  final String serviceName;
  final Color themeColor;
  final Widget body;
  final List<Widget>? extraActions;
  final VoidCallback? onLeadingPressed;
  final VoidCallback? onRefresh;
  final bool registryActions;

  const ServiceScaffold({
    super.key,
    required this.serviceName,
    required this.themeColor,
    required this.body,
    this.extraActions,
    this.onLeadingPressed,
    this.onRefresh,
    this.registryActions = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<NasStatusBloc, NasStatusState>(
      listener: (context, state) {
        state.whenOrNull(
          updating: (name, services, hardwareInfo) {
            if (name.toLowerCase() == serviceName.toLowerCase()) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('UPDATE_TASK_QUEUED: $serviceName process started.'),
                  backgroundColor: AppColors.terminalGreen.withValues(alpha: 0.8),
                ),
              );
            }
          },
          error: (message) {
            if (!message.toLowerCase().contains(serviceName.toLowerCase())) {
              return;
            }
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message), backgroundColor: Colors.redAccent),
            );
          },
        );
      },
      child: BlocBuilder<NasStatusBloc, NasStatusState>(
        builder: (context, state) {
          final isCheckingThis = state.maybeWhen(
            checkingUpdate: (name, _, _) => name.toLowerCase() == serviceName.toLowerCase(),
            orElse: () => false,
          );
          final isUpdatingThis = state.maybeWhen(
            updating: (name, _, _) => name.toLowerCase() == serviceName.toLowerCase(),
            orElse: () => false,
          );
          final showOverlay = isCheckingThis || isUpdatingThis;

          return Scaffold(
            appBar: TuiAppBar(
              title: '${serviceName}_REQUEST',
              titleColor: themeColor,
              onLeadingPressed: onLeadingPressed,
              actions: [
                if (registryActions)
                  ServiceUpdateAction(serviceName: serviceName, color: themeColor),
                if (onRefresh != null)
                  IconButton(
                    icon: const Icon(Icons.refresh, size: 20),
                    tooltip: 'Atualizar',
                    onPressed: onRefresh,
                  )
                else if (registryActions)
                  ServiceRefreshAction(serviceName: serviceName),
                if (extraActions != null) ...extraActions!,
              ],
            ),
            body: Stack(
              children: [
                body,
                if (showOverlay)
                  Container(
                    color: Colors.black.withValues(alpha: 0.7),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const BrailleSpinner(fontSize: 32),
                          const SizedBox(height: AppSpacing.md),
                          Text(
                            isCheckingThis ? 'SYNCING_REGISTRY...' : 'UPDATING_MODULE...',
                            style: AppTypography.moduleLabel.copyWith(color: themeColor),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
