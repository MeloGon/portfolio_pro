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
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors
                              .black, // Fondo negro para similar la imagen
                          borderRadius:
                              BorderRadius.circular(15), // Bordes redondeados
                          border: Border.all(
                            width: 4, // Ancho del borde
                            color: Colors
                                .transparent, // Color transparente inicial
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.orange.withOpacity(
                                  0.6), // Color anaranjado semi-transparente
                              spreadRadius: 3, // Expansión del color
                              blurRadius: 5, // Difuminado del borde
                            ),
                          ],
                        ),
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.all(10),
                        child: CircleAvatar(
                          radius: 50,
                        ),
                      ),
                      const SizedBox(height: 20),
                      StyledText.headlineLarge("Hello world"),
                      Text(
                        'Kevyn Melo',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text('Mobile Developer'),
                      Text('Arequipa, Perú'),
                      Row(
                        children: [
                          IconButton(
                              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                              icon: FaIcon(
                                FontAwesomeIcons.linkedin,
                                color: Colors.orange.withOpacity(0.6),
                              ),
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
              ),
              const SizedBox(width: 20),
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
