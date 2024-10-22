import 'package:flutter/material.dart';
import 'package:portfolio/config/enums/languages_names_enum.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/presentation/widgets/widgets.dart';

extension LanguagesExtensions on String {
  Widget get toLanguage {
    if (this == LanguageNames.flutter.language) {
      return const LanguageChipWidget(
          languageName: 'Flutter', languageIcon: Icon(Symbols.flutter));
    } else if (this == LanguageNames.android.language) {
      return const LanguageChipWidget(
          languageName: 'Android', languageIcon: Icon(Symbols.android));
    } else if (this == LanguageNames.swift.language) {
      return const LanguageChipWidget(
          languageName: 'Swift', languageIcon: Icon(Symbols.ios));
    } else if (this == LanguageNames.kotlin.language) {
      return const LanguageChipWidget(
          languageName: 'Kotlin', languageIcon: Icon(Symbols.android));
    } else {
      return const SizedBox();
    }
  }
}
