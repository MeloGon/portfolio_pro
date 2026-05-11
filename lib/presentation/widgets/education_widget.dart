import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/presentation/providers/firebase_connection.dart';
import 'package:portfolio/presentation/widgets/atoms/hover_lift.dart';

class EducationWidget extends ConsumerWidget {
  const EducationWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getEducation = ref.watch(getEducationProvider);
    return getEducation.when(
      data: (list) => Column(
        children: [for (final edu in list) _EducationCard(education: edu)],
      ),
      error: (e, _) => Text('$e'),
      loading: () => const SizedBox.shrink(),
    );
  }
}

class _EducationCard extends StatelessWidget {
  final dynamic education;
  const _EducationCard({required this.education});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: HoverLift(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? bgCard : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isDark ? borderColor : const Color(0xFFE6D9C8),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: accentWarm.withValues(alpha: .16),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Symbols.school_rounded,
                  color: accentWarm,
                  size: 22,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      education.name ?? '',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: isDark ? textPrimary : const Color(0xFF172022),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      education.degree ?? '',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isDark ? textSecondary : const Color(0xFF5E6869),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                education.date ?? '',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: isDark ? textSecondary : const Color(0xFF5E6869),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
