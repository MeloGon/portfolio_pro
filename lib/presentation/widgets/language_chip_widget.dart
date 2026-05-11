import 'package:flutter/material.dart';
import 'package:portfolio/config/theme/app_theme.dart';

class LanguageChipWidget extends StatelessWidget {
  final String languageName;
  final Icon? languageIcon;
  final Color? color;

  const LanguageChipWidget({
    super.key,
    required this.languageName,
    this.languageIcon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: isDark ? bgSurface : const Color(0xFFFFFBF3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: accentPrimary.withValues(alpha: .25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (languageIcon != null) ...[
            IconTheme(
              data: const IconThemeData(size: 14, color: accentPrimary),
              child: languageIcon!,
            ),
            const SizedBox(width: 5),
          ],
          Text(
            languageName,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: isDark ? textPrimary : Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
