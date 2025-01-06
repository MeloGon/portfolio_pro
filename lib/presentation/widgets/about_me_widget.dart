import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/config/config.dart';
import 'package:portfolio/config/constants/my_strings.dart';
import 'package:portfolio/presentation/providers/firebase_connection.dart';
import 'package:portfolio/presentation/widgets/widgets.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

class AboutMeWidget extends ConsumerWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(getProfileProvider);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox.square(
                dimension: 200,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.2),
                        shape: BoxShape.circle)),
              ),
              const Positioned(
                top: 20,
                left: 20,
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/images/profile.jpeg'),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ],
          ),
          20.h,
          profile.when(
              data: (data) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StyledText.headlineLarge(
                        data.name ?? '',
                        fontWeight: FontWeight.w900,
                      ),
                      StyledText.bodyLarge(data.grade ?? ''),
                      10.h,
                      StyledText.bodyMedium(data.place ?? ''),
                      10.h,
                      Wrap(
                        children: [
                          IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.linkedin,
                                color: Colors.orange.withOpacity(0.6),
                              ),
                              onPressed: () {
                                js.context.callMethod('open', [
                                  "https://www.linkedin.com/in/kevyn-mauro-melo-gonzales-183160208/"
                                ]);
                              }),
                          IconButton(
                              icon: const FaIcon(FontAwesomeIcons.github),
                              color: Colors.orange.withOpacity(0.6),
                              onPressed: () {
                                js.context.callMethod(
                                    'open', ["https://github.com/MeloGon"]);
                              }),
                        ],
                      ),
                      20.h,
                      StyledText.headlineMedium(
                        'About',
                        fontWeight: FontWeight.w500,
                      ),
                      20.h,
                      StyledText.bodyMedium(data.description ?? ''),
                      20.h,
                    ],
                  ),
              error: (error, stackTrace) =>
                  const Text(MyStrings.thereIsaProblem),
              loading: () => const SizedBox.shrink()),
          const DownloadResumeWidget(),
          20.h,
          const ThemeButtonWidget(),
        ],
      ),
    );
  }
}
