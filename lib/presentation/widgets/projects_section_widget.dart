import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/config/config.dart';
import 'package:portfolio/domain/entities/project.dart';
import 'dart:js' as js;

class ProjectsSectionWidget extends StatelessWidget {
  const ProjectsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.h,
        StyledText.headlineLarge(
          'Projects',
          fontWeight: FontWeight.w700,
        ),
        20.h,
        Wrap(
          spacing: 20,
          runSpacing: 10,
          children: List.generate(projectsData.length, (index) {
            final project = projectsData[index];
            return SizedBox(
              width: 300,
              child: GestureDetector(
                onTap: () {
                  if (project.url?.isNotEmpty ?? false) {
                    js.context.callMethod('open', [project.url]);
                  }
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (project.url?.isNotEmpty ?? false)
                          StyledText.bodySmall('Published'),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Symbols.folder),
                            10.w,
                            StyledText.bodyLarge(
                              project.title,
                              fontWeight: FontWeight.w700,
                            ),
                            const Spacer(),
                            if (project.url?.isNotEmpty ?? false)
                              GestureDetector(
                                  onTap: () {
                                    js.context
                                        .callMethod('open', [project.url]);
                                  },
                                  child: const Icon(Icons.link))
                          ],
                        ),
                        10.h,
                        StyledText.bodyMedium(
                          project.description,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
        20.h,
      ],
    );
  }
}
