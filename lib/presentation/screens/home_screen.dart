import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/config/config.dart';
import 'package:portfolio/config/constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return IconButton(
        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
        icon: FaIcon(FontAwesomeIcons.gamepad),
        onPressed: () {
          print("Pressed");
        });
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: Sizes.maxWidth),
          child: Row(
            children: [
              Expanded(
                //flex: (Responsive.isMobile(context)) ? 9 : 2,
                flex: 2,
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: CircleAvatar(
                        radius: 50,
                      ),
                    ),
                    Text('Kevyn Melo'),
                    Text('Mobile Developer'),
                    Text('Arequipa, Perú'),
                    Row(
                      children: [
                        IconButton(
                            // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                            icon: FaIcon(FontAwesomeIcons.linkedin),
                            onPressed: () {
                              print("Pressed");
                            }),
                        IconButton(
                            // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                            icon: FaIcon(FontAwesomeIcons.envelopesBulk),
                            onPressed: () {
                              print("Pressed");
                            }),
                        IconButton(
                            // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                            icon: FaIcon(FontAwesomeIcons.github),
                            onPressed: () {
                              print("Pressed");
                            }),
                      ],
                    ),
                    Text('About'),
                    Text(
                        'Ssr mobile developer with a passion for build mobile applications. Currently seeking oportunities to further develop my skills in a professional setting')
                  ],
                ),
              ),
              Expanded(
                flex: 7,
                child: Text('data2'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
