import 'package:flutter/material.dart';
import 'package:portfolio/config/theme/app_theme.dart';

class SocialIconButton extends StatelessWidget {
  const SocialIconButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final Widget icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Tooltip(
      message: label,
      child: IconButton(
        onPressed: onTap,
        style: IconButton.styleFrom(
          backgroundColor: isDark ? bgSurface : const Color(0xFFFFFBF3),
          foregroundColor: isDark ? textPrimary : const Color(0xFF172022),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: isDark ? borderColor : const Color(0xFFE6D9C8),
            ),
          ),
        ),
        icon: icon,
      ),
    );
  }
}
