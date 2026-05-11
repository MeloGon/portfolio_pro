import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/config/l10n/app_translations.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/presentation/providers/state.dart';

class PortfolioNavbar extends ConsumerWidget {
  const PortfolioNavbar({
    super.key,
    required this.items,
    required this.onItemTap,
  });

  final List<NavItem> items;
  final ValueChanged<int> onItemTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(languageModeProvider);
    final darkMode = ref.watch(darkModeProvider);
    final t = AppTranslations(language);
    final isCompact = MediaQuery.sizeOf(context).width < 760;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          isCompact ? 16 : 32,
          16,
          isCompact ? 16 : 32,
          0,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: (isDark ? bgSurface : Colors.white).withValues(alpha: .88),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isDark ? borderColor : const Color(0xFFE6D9C8),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? .22 : .08),
                blurRadius: 24,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                _BrandMark(isCompact: isCompact),
                const Spacer(),
                if (!isCompact)
                  Flexible(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var i = 0; i < items.length; i++)
                            _NavButton(
                              label: items[i].label,
                              onTap: () => onItemTap(i),
                            ),
                        ],
                      ),
                    ),
                  ),
                IconButton(
                  tooltip: t.otherLocaleLabel,
                  onPressed: () =>
                      ref.read(languageModeProvider.notifier).toggleLanguage(),
                  icon: Text(
                    t.localeLabel,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: accentSecondary,
                    ),
                  ),
                ),
                IconButton(
                  tooltip: darkMode ? t.lightMode : t.darkMode,
                  onPressed: () =>
                      ref.read(darkModeProvider.notifier).toggleDarkMode(),
                  icon: Icon(
                    darkMode
                        ? Icons.light_mode_outlined
                        : Icons.dark_mode_outlined,
                    size: 20,
                  ),
                ),
                if (isCompact)
                  PopupMenuButton<int>(
                    tooltip: 'Menu',
                    icon: const Icon(Icons.menu_rounded),
                    onSelected: onItemTap,
                    itemBuilder: (context) => [
                      for (var i = 0; i < items.length; i++)
                        PopupMenuItem(value: i, child: Text(items[i].label)),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavItem {
  const NavItem(this.label);

  final String label;
}

class _BrandMark extends StatelessWidget {
  const _BrandMark({required this.isCompact});

  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 34,
          height: 34,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: accentPrimary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'K',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: const Color(0xFF051010),
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        if (!isCompact) ...[
          const SizedBox(width: 10),
          Text(
            'Kevyn Melo',
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w900),
          ),
        ],
      ],
    );
  }
}

class _NavButton extends StatefulWidget {
  const _NavButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: TextButton(
        onPressed: widget.onTap,
        style: TextButton.styleFrom(
          foregroundColor: _hovered ? accentSecondary : null,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(widget.label),
      ),
    );
  }
}
