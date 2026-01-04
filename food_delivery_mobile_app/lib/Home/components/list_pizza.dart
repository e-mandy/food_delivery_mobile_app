import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

List<String> images = [
  "lib/images/1.jpeg",
  "lib/images/2.jpeg",
  "lib/images/3.jpeg",
  "lib/images/4.jpeg",
];

class ListPizza extends StatelessWidget {
  const ListPizza({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280, // Augmenté pour laisser de la place aux boutons qui dépassent
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20), // Plus d'espace entre les cartes
            child: PizzaImage(imagePath: images[index]),
          );
        },
      ),
    );
  }
}

class PizzaImage extends StatelessWidget {
  final String imagePath;
  const PizzaImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220, // Largeur fixe pour chaque carte
      child: Stack(
        clipBehavior: Clip.none, // Très important pour que les boutons puissent dépasser en bas
        children: [
          // 1. L'IMAGE DE FOND ARRONDIE
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              imagePath,
              width: 220,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),

          // 2. LE TEXTE EN HAUT (Optionnel selon ton design actuel)
          // Positioned(
          //   top: 20,
          //   left: 20,
          //   child: const Text(
          //     "Premium\nSelection",
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 18,
          //       fontWeight: FontWeight.bold,
          //       shadows: [Shadow(color: Colors.black45, blurRadius: 10)],
          //     ),
          //   ),
          // ),

          // 3. LES BOUTONS EN BAS
          Positioned(
            bottom: 40, // Ajuste pour faire monter/descendre les boutons
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Bouton Add To Cart (Blanc)
                _buildActionButton(
                  text: "Add To Cart",
                  bgColor: Colors.white,
                  textColor: Colors.black,
                ),
                // Bouton Order Now (Orange)
                _buildActionButton(
                  text: "Order Now",
                  bgColor: Colors.deepOrange,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 500.ms).slideX(begin: 0.2);
  }

  // Petit widget interne pour créer les boutons identiques
  Widget _buildActionButton({required String text, required Color bgColor, required Color textColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}