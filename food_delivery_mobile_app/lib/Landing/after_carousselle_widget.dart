import 'package:flutter/material.dart';


class AfterCaroussel extends StatelessWidget {
  const AfterCaroussel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment aligne les textes à gauche ou au centre
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Authentic Pizza",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Theme.of(
              context,
            ).colorScheme.primary, // Utilise ton orange du thème
          ),
        ),
        const SizedBox(height: 8), // Petit espace entre les deux textes
        const Text(
          "Delivered to Your Door!",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800, // Très gras comme sur l'image
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          "Order now for authentic, delicious\nFresh pizza!", // \n pour passer à la ligne
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ],
    );
  }
}
