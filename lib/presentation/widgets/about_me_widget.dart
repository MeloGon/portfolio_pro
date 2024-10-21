import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/presentation/widgets/widgets.dart';

import '../../config/config.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
   return  Padding(
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
         const ThemeButtonWidget(),
       ],
     ),
   );
  }
}
