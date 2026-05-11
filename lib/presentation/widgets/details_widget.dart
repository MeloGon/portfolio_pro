import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/config/l10n/app_translations.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/presentation/providers/state.dart';
import 'package:portfolio/presentation/widgets/widgets.dart';

class DetailsWidget extends ConsumerWidget {
  const DetailsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppTranslations(ref.watch(languageModeProvider));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionShell(
          title: t.experience,
          kicker: t.featuredWork,
          child: const ExperienceTilesWidget(),
        ),
        SectionShell(
          title: t.projects,
          delay: const Duration(milliseconds: 80),
          child: const ProjectsSectionWidget(),
        ),
        SectionShell(
          title: t.skills,
          delay: const Duration(milliseconds: 140),
          child: const SkillsWidget(),
        ),
        SectionShell(
          title: t.education,
          delay: const Duration(milliseconds: 200),
          child: const EducationWidget(),
        ),
        Center(
          child: Text(
            t.builtWith,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: accentPrimary.withValues(alpha: .65),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
