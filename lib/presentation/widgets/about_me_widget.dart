import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/config/config.dart';
import 'package:portfolio/config/constants/my_strings.dart';
import 'package:portfolio/presentation/providers/firebase_connection.dart';
import 'package:portfolio/presentation/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

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
                        color: Colors.white.withValues(alpha: .2),
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
                                color: Colors.orange.withValues(alpha: 0.6),
                              ),
                              onPressed: () async {
                                await launchUrl(Uri.parse(
                                    "https://www.linkedin.com/in/kevyn-mauro-melo-gonzales-183160208/"));
                              }),
                          IconButton(
                              icon: const FaIcon(FontAwesomeIcons.github),
                              color: Colors.orange.withValues(alpha: 0.6),
                              onPressed: () async {
                                await launchUrl(
                                    Uri.parse("https://github.com/MeloGon"));
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
