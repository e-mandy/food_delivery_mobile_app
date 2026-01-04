import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

List<String> images = [
  "lib/images/1.jpeg",
  "lib/images/2.jpeg",
  "lib/images/3.jpeg",
  "lib/images/4.jpeg",
];

class ListPizza extends StatelessWidget {
  const ListPizza({super.key}); // Nettoyage du constructeur

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          // On passe l'image correspondante à chaque widget
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: PizzaImage(imagePath: images[0]),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: PizzaImage(imagePath: images[1]),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: PizzaImage(imagePath: images[2]),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: PizzaImage(imagePath: images[3]),
          ),
        ],
      ),
    );
  }
}

class PizzaImage extends StatelessWidget {
  // 1. On déclare la variable qui va recevoir le chemin de l'image
  final String imagePath;

  // 2. On l'ajoute au constructeur (obligatoire)
  const PizzaImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            imagePath, 
            width: 200,
            height: 250, // Ajusté pour rentrer dans le SizedBox de 250
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Text(
            "The\nPizza\nBurger\nPie",
            style: const TextStyle(
              color: Colors.white, 
              fontSize: 22, 
              fontWeight: FontWeight.bold,
              height: 1.1, // Resserre un peu les lignes du texte
            ),
          ).animate().fade().scaleXY(delay: 900.ms),
        ),
      ],
    );
  }
}