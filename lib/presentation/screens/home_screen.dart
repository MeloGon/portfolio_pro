import 'package:flutter/material.dart';
import 'package:portfolio/config/config.dart';
import 'package:portfolio/config/constants/sizes.dart';
import 'package:portfolio/presentation/widgets/about_me_widget.dart';
import 'package:portfolio/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            constraints: const BoxConstraints(maxWidth: Sizes.maxWidth),
            child: Responsive(
              mobile: Column(
                
                children: [
                  const AboutMeWidget(),
                  20.w,
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Experience'),
                        20.h,
                         const ExperienceTiles(),
                      ],
                    ),
                  ),
                ],
              ),
              desktop: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: const AboutMeWidget(),
                  ),
                  20.w,
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Experience'),
                        20.h,
                        const ExperienceTiles(),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
