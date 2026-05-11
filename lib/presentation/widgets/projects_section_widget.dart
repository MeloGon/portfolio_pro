import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/config/l10n/app_translations.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/presentation/providers/firebase_connection.dart';
import 'package:portfolio/presentation/providers/state.dart';
import 'package:portfolio/presentation/widgets/atoms/hover_lift.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSectionWidget extends ConsumerWidget {
  const ProjectsSectionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getProjects = ref.watch(getProjectsProvider);
    final t = AppTranslations(ref.watch(languageModeProvider));
    return getProjects.when(
      data: (projects) => Wrap(
        spacing: 16,
        runSpacing: 16,
        children: List.generate(
          projects.length,
          (i) => _ProjectCard(project: projects[i], translations: t),
        ),
      ),
      error: (e, _) => const Text('Error loading projects'),
      loading: () => const SizedBox.shrink(),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final dynamic project;
  final AppTranslations translations;
  const _ProjectCard({required this.project, required this.translations});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hasUrl = widget.project.url?.isNotEmpty ?? false;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: hasUrl ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: HoverLift(
        onTap: hasUrl ? () => launchUrl(Uri.parse(widget.project.url!)) : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 270,
          decoration: BoxDecoration(
            color: isDark ? bgCard : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _hovered
                  ? accentPrimary.withValues(alpha: .65)
                  : (isDark ? borderColor : const Color(0xFFE2E8F0)),
              width: _hovered ? 1.5 : 1,
            ),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: accentPrimary.withValues(alpha: .18),
                      blurRadius: 22,
                      spreadRadius: 2,
                    ),
                  ]
                : [],
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (b) => const LinearGradient(
                      colors: [accentPrimary, accentSecondary],
                    ).createShader(b),
                    child: const Icon(Symbols.folder, size: 28),
                  ),
                  const Spacer(),
                  if (hasUrl)
                    Icon(
                      Icons.arrow_outward_rounded,
                      size: 18,
                      color: _hovered
                          ? accentPrimary
                          : (isDark ? textSecondary : Colors.black38),
                    ),
                ],
              ),
              const SizedBox(height: 14),
              if (hasUrl)
                Text(
                  widget.translations.published,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: const Color(0xFF10B981),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              if (!hasUrl)
                Text(
                  widget.translations.privateProject,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: accentWarm,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              const SizedBox(height: 4),
              Text(
                widget.project.title ?? '',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isDark ? textPrimary : Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.project.description ?? '',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: isDark ? textSecondary : Colors.black54,
                  height: 1.5,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
