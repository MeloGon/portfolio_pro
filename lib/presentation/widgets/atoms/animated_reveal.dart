import 'package:flutter/material.dart';

class AnimatedReveal extends StatelessWidget {
  const AnimatedReveal({
    super.key,
    required this.child,
    this.delay = Duration.zero,
  });

  final Widget child;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 620 + delay.inMilliseconds),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        final delayedValue = (value - (delay.inMilliseconds / 1200)).clamp(
          0,
          1,
        );
        return Opacity(
          opacity: delayedValue.toDouble(),
          child: Transform.translate(
            offset: Offset(0, 22 * (1 - delayedValue.toDouble())),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
