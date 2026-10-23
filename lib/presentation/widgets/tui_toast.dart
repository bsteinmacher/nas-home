import 'dart:async';

import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

enum TuiToastKind { info, success, error }

/// Full-width notice pinned to the physical bottom of the screen.
///
/// Scaffold [SnackBar] always lifts floating bars by [MediaQuery.viewPadding]
/// (and wraps fixed bars in [SafeArea]), which left a gap above the home
/// indicator. An overlay avoids that and still pads the text itself.
class TuiToast {
  static OverlayEntry? _entry;
  static Timer? _timer;

  static void show(
    BuildContext context,
    String message, {
    TuiToastKind kind = TuiToastKind.info,
  }) {
    hide();

    final overlay = Overlay.maybeOf(context, rootOverlay: true);
    if (overlay == null) return;

    final entry = OverlayEntry(
      builder: (overlayContext) {
        final bottomInset = MediaQuery.viewPaddingOf(overlayContext).bottom;
        return Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: _TuiToastBanner(
            message: message,
            kind: kind,
            bottomInset: bottomInset,
            onDismiss: hide,
          ),
        );
      },
    );

    overlay.insert(entry);
    _entry = entry;

    if (kind != TuiToastKind.error) {
      _timer = Timer(const Duration(seconds: 4), hide);
    }
  }

  static void hide() {
    _timer?.cancel();
    _timer = null;
    final entry = _entry;
    _entry = null;
    if (entry != null && entry.mounted) {
      entry.remove();
    }
  }
}

class _TuiToastBanner extends StatelessWidget {
  final String message;
  final TuiToastKind kind;
  final double bottomInset;
  final VoidCallback onDismiss;

  const _TuiToastBanner({
    required this.message,
    required this.kind,
    required this.bottomInset,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    final (prefix, color) = switch (kind) {
      TuiToastKind.success => ('[OK]', AppColors.terminalGreen),
      TuiToastKind.error => ('[ERR]', AppColors.offline),
      TuiToastKind.info => ('[INFO]', AppColors.textPrimary),
    };

    final textStyle = AppTypography.body.copyWith(
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    );

    return Material(
      color: Colors.transparent,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x99000000),
              blurRadius: 24,
              offset: Offset(0, -6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(AppSpacing.borderRadius),
          ),
          child: DecoratedBox(
            decoration: const BoxDecoration(
              gradient: AppColors.terminalGradient,
            ),
            child: ColoredBox(
              color: const Color(0x6A000000),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  AppSpacing.md,
                  AppSpacing.md,
                  AppSpacing.md,
                  AppSpacing.md + bottomInset,
                ),
                child: Semantics(
                  liveRegion: true,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 3,
                        height: 22,
                        margin: const EdgeInsets.only(top: 2),
                        color: color,
                      ),
                      const SizedBox(width: AppSpacing.sm + AppSpacing.xs),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '$prefix ',
                                style: textStyle.copyWith(
                                  color: color,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(text: message, style: textStyle),
                            ],
                          ),
                        ),
                      ),
                      if (kind == TuiToastKind.error)
                        TextButton(
                          onPressed: onDismiss,
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.textPrimary,
                            minimumSize: const Size(44, 44),
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.sm,
                            ),
                          ),
                          child: Text(
                            'DISMISS',
                            style: AppTypography.micro.copyWith(
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
