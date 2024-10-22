import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:portfolio/config/config.dart';
import 'package:portfolio/presentation/widgets/widgets.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StyledText.headlineLarge(
          'Skills',
          fontWeight: FontWeight.w700,
        ),
        const Wrap(
          children: [
            LanguageChipWidget(
              languageName: 'Flutter',
              languageIcon: Icon(Symbols.flutter),
              color: Colors.transparent,
            ),
            LanguageChipWidget(
              languageName: 'Android',
              languageIcon: Icon(Symbols.android),
              color: Colors.transparent,
            ),
            LanguageChipWidget(
              languageName: 'Html5',
              languageIcon: Icon(Symbols.html),
              color: Colors.transparent,
            ),
            LanguageChipWidget(
              languageName: 'CSS',
              languageIcon: Icon(Symbols.css),
              color: Colors.transparent,
            ),
            LanguageChipWidget(
              languageName: 'Swift',
              languageIcon: Icon(Symbols.ios),
              color: Colors.transparent,
            ),
            LanguageChipWidget(
              languageName: 'Dart',
              languageIcon: Icon(Icons.flutter_dash),
              color: Colors.transparent,
            ),
            LanguageChipWidget(
              languageName: 'Python',
              color: Colors.transparent,
            ),
            LanguageChipWidget(
              languageName: 'Java',
              color: Colors.transparent,
            ),
            LanguageChipWidget(
              languageName: 'C#',
              color: Colors.transparent,
            ),
          ],
        ),
        10.h
      ],
    );
  }
}
