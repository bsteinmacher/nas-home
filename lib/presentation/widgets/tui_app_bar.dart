import 'package:flutter/material.dart';
import '../../core/theme/app_typography.dart';

class TuiAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color titleColor;
  final List<Widget>? actions;
  final VoidCallback? onLeadingPressed;

  const TuiAppBar({
    super.key,
    required this.title,
    required this.titleColor,
    this.actions,
    this.onLeadingPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title.toUpperCase(),
        style: AppTypography.terminalTitle.copyWith(color: titleColor),
      ),
      leading: IconButton(
        icon: const Icon(Icons.chevron_left),
        onPressed: onLeadingPressed ?? () => Navigator.pop(context),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
