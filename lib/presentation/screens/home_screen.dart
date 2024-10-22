import 'package:flutter/material.dart';
import 'package:portfolio/config/config.dart';
import 'package:portfolio/config/constants/sizes.dart';
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
              mobile: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const AboutMeWidget(),
                    20.w,
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.h,
                          StyledText.headlineLarge(
                            "Experience",
                            fontWeight: FontWeight.w700,
                          ),
                          20.h,
                          const DetailsWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              desktop: SingleChildScrollView(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      flex: 2,
                      child: AboutMeWidget(),
                    ),
                    20.w,
                    const Expanded(
                      flex: 7,
                      child: DetailsWidget(),
                    )
                  ],
                ),
              ),
            )),
      ),
      bottomNavigationBar: Container(
        height: 30,
        color: Colors.orange.withOpacity(.6),
        child: Align(
          alignment: Alignment.center,
          child: StyledText.bodySmall(
            'Made by Me 🫀',
          ),
        ),
      ),
    );
  }
}
