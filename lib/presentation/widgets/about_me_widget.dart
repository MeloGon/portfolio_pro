import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/config/config.dart';
import 'package:portfolio/presentation/widgets/widgets.dart';
import 'dart:js' as js;

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('assets/images/profile.jpeg'),
            backgroundColor: Colors.transparent,
          ),
          20.h,
          StyledText.headlineLarge(
            "Kevyn Melo",
            fontWeight: FontWeight.w900,
          ),
          StyledText.bodyLarge('Mobile Developer'),
          10.h,
          StyledText.bodyMedium('Arequipa, Perú'),
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
                    js.context
                        .callMethod('open', ["https://github.com/MeloGon"]);
                  }),
            ],
          ),
          20.h,
          StyledText.headlineMedium(
            'About',
            fontWeight: FontWeight.w500,
          ),
          20.h,
          StyledText.bodyMedium(
              'Ssr mobile developer with a passion for build mobile applications. Currently seeking oportunities to further develop my skills in a professional setting'),
          20.h,
          const ThemeButtonWidget(),
        ],
      ),
    );
  }
}
