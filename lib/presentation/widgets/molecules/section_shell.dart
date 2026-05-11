import 'package:flutter/material.dart';
import 'package:portfolio/presentation/widgets/atoms/animated_reveal.dart';
import 'package:portfolio/presentation/widgets/atoms/app_section_title.dart';

class SectionShell extends StatelessWidget {
  const SectionShell({
    super.key,
    required this.title,
    required this.child,
    this.kicker,
    this.delay = Duration.zero,
  });

  final String title;
  final String? kicker;
  final Widget child;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    return AnimatedReveal(
      delay: delay,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 56),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSectionTitle(title: title, kicker: kicker),
            const SizedBox(height: 22),
            child,
          ],
        ),
      ),
    );
  }
}
