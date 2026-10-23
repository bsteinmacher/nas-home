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
  final String? title;

  const ServiceScaffold({
    super.key,
    required this.serviceName,
    required this.themeColor,
    required this.body,
    this.extraActions,
    this.onLeadingPressed,
    this.onRefresh,
    this.registryActions = true,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NasStatusBloc, NasStatusState>(
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
            title: title ?? serviceName,
            titleColor: themeColor,
            onLeadingPressed: onLeadingPressed,
            actions: [
              if (registryActions)
                ServiceUpdateAction(serviceName: serviceName, color: themeColor),
              if (onRefresh != null)
                IconButton(
                  icon: const Icon(Icons.refresh),
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
                Positioned.fill(
                  child: AbsorbPointer(
                    child: ColoredBox(
                      color: AppColors.background.withValues(alpha: 0.92),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            BrailleSpinner(fontSize: 32, color: themeColor),
                            const SizedBox(height: AppSpacing.md),
                            Text(
                              isCheckingThis ? 'SYNCING_REGISTRY' : 'UPDATING_MODULE',
                              style: AppTypography.label.copyWith(color: themeColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
