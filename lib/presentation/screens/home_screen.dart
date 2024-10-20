import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/config/config.dart';
import 'package:portfolio/config/constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/presentation/providers/state.dart';
import 'package:timelines_plus/timelines_plus.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);
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
                      20.h,
                      StyledText.headlineLarge(
                        "Kevyn Melo",
                        fontWeight: FontWeight.w900,
                      ),
                      StyledText.bodyLarge('Mobile Developer'),
                      10.h,
                      Text('Arequipa, Perú'),
                      10.h,
                      Wrap(
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
                              color: Colors.orange.withOpacity(0.6),
                              onPressed: () {
                                print("Pressed");
                              }),
                          IconButton(
                              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                              icon: FaIcon(FontAwesomeIcons.github),
                              color: Colors.orange.withOpacity(0.6),
                              onPressed: () {
                                print("Pressed");
                              }),
                        ],
                      ),
                      20.h,
                      StyledText.headlineMedium(
                        'About',
                        fontWeight: FontWeight.w500,
                      ),
                      20.h,
                      Text(
                          'Ssr mobile developer with a passion for build mobile applications. Currently seeking oportunities to further develop my skills in a professional setting'),
                      20.h,
                      FloatingActionButton(
                        onPressed: () {
                          ref.read(darkModeProvider.notifier).toggleDarkMode();
                        },
                        child: darkMode
                            ? const Icon(Icons.dark_mode_outlined)
                            : const Icon(Icons.light_mode_outlined),
                      ),
                    ],
                  ),
                ),
              ),
              20.w,
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Experience'),
                    20.h,
                    FixedTimeline.tileBuilder(
                      theme: TimelineTheme.of(context).copyWith(
                          nodePosition: .1,
                          color: Color.fromARGB(255, 245, 186, 92)),
                      builder: TimelineTileBuilder.connectedFromStyle(
                        contentsAlign: ContentsAlign.reverse,
                        oppositeContentsBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                  'Developing and maintaining web applications using JavaScript, HTML, and CSS. Collaborating with the team to implement new features and fix bugs.'),
                            ],
                          ),
                        ),
                        contentsBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('2024 - present'),
                        ),
                        connectorStyleBuilder: (context, index) =>
                            ConnectorStyle.solidLine,
                        indicatorStyleBuilder: (context, index) =>
                            IndicatorStyle.dot,
                        itemCount: 3,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
