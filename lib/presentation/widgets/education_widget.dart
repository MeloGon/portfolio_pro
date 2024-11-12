import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:portfolio/config/config.dart';
import 'package:portfolio/presentation/providers/firebase_connection.dart';

class EducationWidget extends ConsumerWidget {
  const EducationWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getEducation = ref.watch(getEducationProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StyledText.headlineLarge(
          'Education',
          fontWeight: FontWeight.w700,
        ),
        20.h,
        getEducation.when(
            data: (listEducation) => Column(
                  children: [
                    for (var education in listEducation)
                      Row(
                        children: [
                          const Icon(Symbols.school_rounded),
                          10.w,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              StyledText.bodyMedium(education.name ?? ''),
                              StyledText.bodySmall(education.degree ?? '')
                            ],
                          ),
                          const Spacer(),
                          StyledText.bodySmall(education.date ?? ''),
                        ],
                      )
                  ],
                ),
            error: (error, stackTrace) => Text('$error'),
            loading: () => const CircularProgressIndicator()),
      ],
    );
  }
}
