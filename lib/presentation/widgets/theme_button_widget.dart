import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/config/l10n/app_translations.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/presentation/providers/state.dart';

class ThemeButtonWidget extends ConsumerWidget {
  const ThemeButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);
    final t = AppTranslations(ref.watch(languageModeProvider));
    return GestureDetector(
      onTap: () => ref.read(darkModeProvider.notifier).toggleDarkMode(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: darkMode ? bgCard : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: darkMode ? borderColor : const Color(0xFFE2E8F0),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              darkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
              size: 17,
              color: darkMode ? textPrimary : Colors.black87,
            ),
            const SizedBox(width: 8),
            Text(
              darkMode ? t.lightMode : t.darkMode,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: darkMode ? textPrimary : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
