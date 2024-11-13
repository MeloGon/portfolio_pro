import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const AlignmentDirectional(-1.2, -1),
          child: SizedBox.square(
            dimension: 400,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange.withOpacity(.3),
              ),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(1.0, .9),
          child: SizedBox.square(
            dimension: 360,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange.withOpacity(.3),
              ),
            ),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
          child: const DecoratedBox(
              decoration: BoxDecoration(color: Colors.transparent)),
        ),
      ],
    );
  }
}
