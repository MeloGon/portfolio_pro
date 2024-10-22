import 'package:flutter/material.dart';
import 'package:portfolio/config/config.dart';
import 'package:portfolio/presentation/widgets/widgets.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.h,
          StyledText.headlineLarge(
            "Experience",
            fontWeight: FontWeight.w700,
          ),
          20.h,
          const ExperienceTilesWidget(),
          const ProjectsSectionWidget(),
          const SkillsWidget(),
          const EducationWidget(),
        ],
      ),
    );
  }
}
