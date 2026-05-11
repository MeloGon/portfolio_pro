import 'package:flutter/material.dart';
import 'package:portfolio/config/theme/app_theme.dart';

class AppSectionTitle extends StatelessWidget {
  const AppSectionTitle({super.key, required this.title, this.kicker});

  final String title;
  final String? kicker;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (kicker != null) ...[
          Text(
            kicker!.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: accentSecondary,
              fontWeight: FontWeight.w800,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 6),
        ],
        Row(
          children: [
            Container(
              width: 28,
              height: 3,
              decoration: BoxDecoration(
                color: accentPrimary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: isDark ? textPrimary : const Color(0xFF172022),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
