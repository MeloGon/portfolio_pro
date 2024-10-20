import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  late final TextStyle? Function(BuildContext context)? getStyle;

  StyledText.headlineLarge(this.text, {this.fontWeight, super.key}) {
    getStyle = (context) {
      return Theme.of(context)
          .textTheme
          .headlineLarge
          ?.copyWith(fontWeight: fontWeight);
    };
  }

  StyledText.headlineMedium(this.text, {this.fontWeight, super.key}) {
    getStyle = (context) {
      return Theme.of(context)
          .textTheme
          .headlineMedium
          ?.copyWith(fontWeight: fontWeight);
    };
  }

  StyledText.headlineSmall(this.text, {this.fontWeight, super.key}) {
    getStyle = (context) {
      return Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(fontWeight: fontWeight);
    };
  }

  StyledText.bodyLarge(this.text, {this.fontWeight, super.key}) {
    getStyle = (context) {
      return Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(fontWeight: fontWeight);
    };
  }

  StyledText.bodyMedium(this.text, {this.fontWeight, super.key}) {
    getStyle = (context) {
      return Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(fontWeight: fontWeight);
    };
  }

  StyledText.bodySmall(this.text, {this.fontWeight, super.key}) {
    getStyle = (context) {
      return Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(fontWeight: fontWeight);
    };
  }

  StyledText.labelLarge(this.text, {this.fontWeight, super.key}) {
    getStyle = (context) {
      return Theme.of(context)
          .textTheme
          .labelLarge
          ?.copyWith(fontWeight: fontWeight);
    };
  }

  StyledText.labelMedium(this.text, {this.fontWeight, super.key}) {
    getStyle = (context) {
      return Theme.of(context)
          .textTheme
          .labelMedium
          ?.copyWith(fontWeight: fontWeight);
    };
  }

  StyledText.labelSmall(this.text, {this.fontWeight, super.key}) {
    getStyle = (context) {
      return Theme.of(context)
          .textTheme
          .labelSmall
          ?.copyWith(fontWeight: fontWeight);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Text(text, style: getStyle?.call(context));
  }
}
