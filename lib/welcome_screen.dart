import 'package:flutter/material.dart';
import 'home_screen.dart';
// Attention : vérifie bien si ton package est 'slider_button' ou 'slide_button' 
// dans ton pubspec.yaml. Ici j'utilise SliderButton (le plus commun).
import 'package:slider_button/slider_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // --- ZONE DES CATÉGORIES ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCategoryItem("Neapolitan", Colors.orange),
                  _buildCategoryItem("Margherita", Colors.black),
                  _buildCategoryItem("Pepperoni", Colors.orange),
                ],
              ),

              const SizedBox(height: 16),

              // --- ZONE IMAGE ---
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4T5DnkHaRm_TuNPFySDqHUlRlUL5ptclqNA&s',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // --- ZONE TEXTES ---
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    Text(
                      "Authentic Pizza",
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Delivered to Your Door!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Order now for authentic, delicious\nFresh pizza!",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // --- ZONE DU BOUTON DYNAMIQUE ---
              // On appelle notre fonction ici pour afficher le vrai bouton !
              _buildSwipeButton(context),
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Fonction pour construire les petits textes du haut
  Widget _buildCategoryItem(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        text,
        style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }

  // NOTRE NOUVEAU WIDGET DYNAMIQUE
  Widget _buildSwipeButton(BuildContext context) {
    return Center(
      child: SliderButton(
        // Ce qui se passe quand on finit de slider
        action: () async {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
          return true; // On confirme au bouton que l'action est faite
        },
        // Le texte qui s'affiche dans la barre
        label: const Text(
          "Swipe To Explore",
          style: TextStyle(
              color: Color(0xff4a4a4a), 
              fontWeight: FontWeight.w500, 
              fontSize: 17
          ),
        ),
        // L'icône qui bouge (le cercle orange)
        icon: const Center(
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 20.0,
          ),
        ),
        // Design du bouton
        width: MediaQuery.of(context).size.width * 0.85, // 85% de la largeur
        radius: 50,
        buttonColor: Colors.orange,
        backgroundColor: Colors.grey[100]!,
        highlightedColor: Colors.orange,
        baseColor: Colors.grey[600]!,
      ),
    );
  }
}