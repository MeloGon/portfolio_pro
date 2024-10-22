import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:portfolio/config/config.dart';
import 'package:portfolio/domain/entities/education.dart';

class EducationWidget extends StatelessWidget {
  const EducationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StyledText.headlineLarge(
          'Education',
          fontWeight: FontWeight.w700,
        ),
        20.h,
        for (var education in educationData)
          Row(
            children: [
              const Icon(Symbols.school_rounded),
              10.w,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledText.bodyMedium(education.name),
                  StyledText.bodySmall(education.degree)
                ],
              ),
              const Spacer(),
              StyledText.bodySmall(education.date),
              20.w
            ],
          ),
      ],
    );
  }
}
