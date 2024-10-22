import 'package:flutter/material.dart';
import 'package:portfolio/config/config.dart';

class LanguageChipWidget extends StatelessWidget {
  final String languageName;
  final Icon? languageIcon;
  final Color? color;
  const LanguageChipWidget(
      {super.key, required this.languageName, this.languageIcon, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 10),
      child: Chip(
        padding: const EdgeInsets.all(.2),
        color: WidgetStateProperty.resolveWith((states) {
          return color ?? Colors.orange.withOpacity(.3);
        }),
        shape: const StadiumBorder(
          side: BorderSide(style: BorderStyle.none),
        ),
        label: StyledText.labelMedium(languageName),
        avatar: languageIcon,
      ),
    );
  }
}
