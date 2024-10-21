import 'package:flutter/material.dart';
import 'package:portfolio/domain/entities/experience.dart';
import 'package:timelines_plus/timelines_plus.dart';

class ExperienceTiles extends StatelessWidget {
  const ExperienceTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return FixedTimeline.tileBuilder(
      theme: TimelineTheme.of(context).copyWith(
          nodePosition: .1,
          color: const Color.fromARGB(255, 245, 186, 92)),
      builder: TimelineTileBuilder.connectedFromStyle(
        contentsAlign: ContentsAlign.reverse,
        oppositeContentsBuilder: (context, index) {
          final experience =  experiencesTemporal[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                    experience.content),
              ],
            ),
          );
        },
        contentsBuilder: (context, index) {
         final experience =  experiencesTemporal[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(experience.date),
          );
        },
        connectorStyleBuilder: (context, index) =>
        ConnectorStyle.solidLine,
        indicatorStyleBuilder: (context, index) =>
        IndicatorStyle.dot,
        itemCount: experiencesTemporal.length,
      ),
    );
  }
}
