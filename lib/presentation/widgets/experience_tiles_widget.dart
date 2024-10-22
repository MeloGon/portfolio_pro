import 'package:flutter/material.dart';
import 'package:portfolio/config/config.dart';
import 'package:portfolio/config/extensions/languages_extensions.dart';
import 'package:portfolio/domain/entities/experience.dart';
import 'package:timelines_plus/timelines_plus.dart';

class ExperienceTilesWidget extends StatelessWidget {
  const ExperienceTilesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FixedTimeline.tileBuilder(
      theme: TimelineTheme.of(context).copyWith(
          nodePosition: .19,
          color: Colors.grey[300],
          indicatorTheme: const IndicatorThemeData(size: 10)),
      builder: TimelineTileBuilder.connectedFromStyle(
        contentsAlign: ContentsAlign.reverse,
        oppositeContentsBuilder: (context, index) {
          final experience = experiencesTemporal[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledText.bodyLarge(
                  experience.occupation,
                  fontWeight: FontWeight.w500,
                ),
                StyledText.bodySmall(
                  experience.place,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
                StyledText.bodyMedium(experience.content),
                Wrap(
                    children:
                        List.generate(experience.technologies.length, (index) {
                  return experience.technologies[index].toLanguage;
                }).toList()),
              ],
            ),
          );
        },
        contentsBuilder: (context, index) {
          final experience = experiencesTemporal[index];
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: StyledText.bodyMedium(
              experience.date,
              fontWeight: FontWeight.w700,
            ),
          );
        },
        connectorStyleBuilder: (context, index) => ConnectorStyle.solidLine,
        indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
        itemCount: experiencesTemporal.length,
      ),
    );
  }
}
