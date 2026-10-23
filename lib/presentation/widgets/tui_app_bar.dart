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
    final label = title.toUpperCase();
    return AppBar(
      title: Tooltip(
        message: label,
        child: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTypography.title.copyWith(color: titleColor, fontSize: 18),
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.chevron_left),
        tooltip: 'Voltar',
        onPressed: onLeadingPressed ?? () => Navigator.pop(context),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
