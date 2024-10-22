import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/config/config.dart';
import 'package:portfolio/domain/entities/project.dart';

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
        // Wrap(
        //   children: [
        //     Card(
        //       child: Padding(
        //         padding: const EdgeInsets.all(15.0),
        //         child: Column(
        //           mainAxisSize: MainAxisSize.min,
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Row(
        //               mainAxisSize: MainAxisSize.min,
        //               children: [
        //                 const Icon(Symbols.folder),
        //                 10.w,
        //                 StyledText.bodyLarge('Nombre del proyecto'),
        //               ],
        //             ),
        //             StyledText.bodyMedium(
        //               'Trata de esto tal por cual ',
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        Wrap(
          spacing: 20,
          runSpacing: 10,
          children: List.generate(projectsData.length, (index) {
            final project = projectsData[index];
            return SizedBox(
              width: 300,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Symbols.folder),
                          10.w,
                          StyledText.bodyLarge(project.title),
                        ],
                      ),
                      StyledText.bodyMedium(
                        project.description,
                      ),
                    ],
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
