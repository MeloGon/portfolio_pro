import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  final String text;
  late final TextStyle? Function(BuildContext context)? getStyle;

  StyledText.headlineLarge(this.text, {super.key}) {
    getStyle = (context) {
      return Theme.of(context).textTheme.headlineLarge;
    };
  }

  StyledText.headlineMedium(this.text, {super.key}) {
    getStyle = (context) {
      return Theme.of(context).textTheme.headlineMedium;
    };
  }

  StyledText.headlineSmall(this.text, {super.key}) {
    getStyle = (context) {
      return Theme.of(context).textTheme.headlineSmall;
    };
  }

  StyledText.bodyLarge(this.text, {super.key}) {
    getStyle = (context) {
      return Theme.of(context).textTheme.bodyLarge;
    };
  }

  StyledText.bodyMedium(this.text, {super.key}) {
    getStyle = (context) {
      return Theme.of(context).textTheme.bodyMedium;
    };
  }

  StyledText.bodySmall(this.text, {super.key}) {
    getStyle = (context) {
      return Theme.of(context).textTheme.bodySmall;
    };
  }

  StyledText.labelLarge(this.text, {super.key}) {
    getStyle = (context) {
      return Theme.of(context).textTheme.labelLarge;
    };
  }

  StyledText.labelMedium(this.text, {super.key}) {
    getStyle = (context) {
      return Theme.of(context).textTheme.labelMedium;
    };
  }

  StyledText.labelSmall(this.text, {super.key}) {
    getStyle = (context) {
      return Theme.of(context).textTheme.labelSmall;
    };
  }

  @override
  Widget build(BuildContext context) {
    return Text(text, style: getStyle?.call(context));
  }
}
