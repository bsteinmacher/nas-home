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

  const ServiceScaffold({
    super.key,
    required this.serviceName,
    required this.themeColor,
    required this.body,
    this.extraActions,
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
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message), backgroundColor: Colors.redAccent),
            );
          },
        );
      },
      child: BlocBuilder<NasStatusBloc, NasStatusState>(
        builder: (context, state) {
          final isLoading = state is Loading;
          final isUpdatingThis = state.maybeWhen(
            updating: (name, _, _) => name.toLowerCase() == serviceName.toLowerCase(),
            orElse: () => false,
          );

          return Scaffold(
            appBar: TuiAppBar(
              title: '${serviceName}_REQUEST',
              titleColor: themeColor,
              actions: [
                ServiceUpdateAction(serviceName: serviceName, color: themeColor),
                const ServiceRefreshAction(),
                if (extraActions != null) ...extraActions!,
              ],
            ),
            body: Stack(
              children: [
                body,
                if (isLoading || isUpdatingThis)
                  Container(
                    color: Colors.black.withValues(alpha: 0.7),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const BrailleSpinner(fontSize: 32),
                          const SizedBox(height: AppSpacing.md),
                          Text(
                            isLoading ? 'SYNCING_REGISTRY...' : 'UPDATING_MODULE...',
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
