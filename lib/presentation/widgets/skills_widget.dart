import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:portfolio/presentation/widgets/widgets.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const skills = [
      LanguageChipWidget(
        languageName: 'Flutter',
        languageIcon: Icon(Symbols.flutter),
      ),
      LanguageChipWidget(
        languageName: 'Dart',
        languageIcon: Icon(Icons.flutter_dash),
      ),
      LanguageChipWidget(
        languageName: 'Android',
        languageIcon: Icon(Symbols.android),
      ),
      LanguageChipWidget(
        languageName: 'iOS / Swift',
        languageIcon: Icon(Symbols.ios),
      ),
      LanguageChipWidget(
        languageName: 'HTML5',
        languageIcon: Icon(Symbols.html),
      ),
      LanguageChipWidget(languageName: 'CSS', languageIcon: Icon(Symbols.css)),
      LanguageChipWidget(languageName: 'Python'),
      LanguageChipWidget(languageName: 'Java'),
      LanguageChipWidget(languageName: 'C#'),
      LanguageChipWidget(languageName: 'Firebase'),
      LanguageChipWidget(languageName: 'Riverpod'),
      LanguageChipWidget(languageName: 'Clean Architecture'),
    ];

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [for (final skill in skills) HoverLift(child: skill)],
    );
  }
}
