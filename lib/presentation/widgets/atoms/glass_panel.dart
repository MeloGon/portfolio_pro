import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/config/theme/app_theme.dart';

class GlassPanel extends StatelessWidget {
  const GlassPanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: (isDark ? bgCard : Colors.white).withValues(alpha: .78),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isDark ? borderColor : const Color(0xFFE6D9C8),
            ),
          ),
          child: Padding(padding: padding, child: child),
        ),
      ),
    );
  }
}
