

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/presentation/providers/state.dart';

class ThemeButtonWidget extends ConsumerWidget {
  const ThemeButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);
    return FloatingActionButton(
      onPressed: () {
        ref.read(darkModeProvider.notifier).toggleDarkMode();
      },
      child: darkMode
          ? const Icon(Icons.dark_mode_outlined)
          : const Icon(Icons.light_mode_outlined),
    );
  }
}
