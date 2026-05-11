import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/config/extensions/languages_extensions.dart';
import 'package:portfolio/config/extensions/string_extensions.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/presentation/providers/firebase_connection.dart';
import 'package:portfolio/presentation/widgets/atoms/hover_lift.dart';

class ExperienceTilesWidget extends ConsumerWidget {
  const ExperienceTilesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getExperience = ref.watch(getExperienceProvider);
    return getExperience.when(
      data: (list) => Column(
        children: List.generate(
          list.length,
          (i) => _ExperienceCard(experience: list[i]),
        ),
      ),
      error: (e, _) => Text('$e'),
      loading: () => const _LoadingPlaceholder(),
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  final dynamic experience;
  const _ExperienceCard({required this.experience});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: HoverLift(
        child: Container(
          decoration: BoxDecoration(
            color: isDark ? bgCard : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isDark ? borderColor : const Color(0xFFE6D9C8),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 3,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [accentPrimary, accentSecondary, accentWarm],
                  ),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                experience.company ?? '',
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      color: accentSecondary,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                experience.occupation ?? '',
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: isDark
                                          ? textPrimary
                                          : const Color(0xFF172022),
                                    ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 13,
                                    color: isDark
                                        ? textSecondary
                                        : const Color(0xFF5E6869),
                                  ),
                                  const SizedBox(width: 3),
                                  Flexible(
                                    child: Text(
                                      experience.place ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: isDark
                                                ? textSecondary
                                                : const Color(0xFF5E6869),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: accentPrimary.withValues(alpha: .12),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: accentPrimary.withValues(alpha: .25),
                            ),
                          ),
                          child: Text(
                            experience.date ?? '',
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(
                                  color: accentPrimary,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
                      ],
                    ),
                    if ((experience.content as String? ?? '').isNotEmpty) ...[
                      const SizedBox(height: 14),
                      Text(
                        (experience.content as String? ?? '').transformNewLine,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: isDark
                              ? textSecondary
                              : const Color(0xFF4D5A5D),
                          height: 1.6,
                        ),
                      ),
                    ],
                    if ((experience.technologies as List? ?? [])
                        .isNotEmpty) ...[
                      const SizedBox(height: 14),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: List.generate(
                          (experience.technologies as List).length,
                          (i) => (experience.technologies as List)[i]
                              .toString()
                              .toLanguage,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoadingPlaceholder extends StatelessWidget {
  const _LoadingPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        2,
        (_) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Container(
            height: 130,
            decoration: BoxDecoration(
              color: bgCard,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: borderColor),
            ),
          ),
        ),
      ),
    );
  }
}
