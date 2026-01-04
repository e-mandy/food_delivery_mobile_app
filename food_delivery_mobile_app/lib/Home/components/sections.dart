import 'package:flutter/material.dart';

class Sections extends StatelessWidget {
  const Sections({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Ta ligne de titre
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Trending Pizza", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Text("See all", style: TextStyle(fontSize: 17, color: Colors.grey)),
          ],
        ),
        
        const SizedBox(height: 20),

        Stack(
          clipBehavior: Clip.none, // Permet à la barre de dépasser légèrement si besoin
          alignment: Alignment.center,
          children: [
            // 1. Le fond Jaune 
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF3C7), // Jaune pâle comme l'image
                borderRadius: BorderRadius.circular(30),
              ),
            ),

            // Le contenu (Texte + Pizza)
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Row(
                  children: [
                    // Texte à gauche
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Get A\nSlice Of", 
                              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, height: 1.1)),
                            SizedBox(height: 10),
                            Text("Delivery Available 24/7", 
                              style: TextStyle(fontSize: 12, color: Colors.black54)),
                          ],
                        ),
                      ),
                    ),
                    // Image de pizza à droite
                    Expanded(
                      flex: 2,
                      child: Transform.scale(
                        scale: 1.4, // Pour faire sortir la pizza du cadre
                        child: Image.asset(
                          "lib/images/1.jpeg",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            
            // Le coeur en haut
            Positioned(
              top: 15,
              left: 15,
              child: CircleAvatar(
                backgroundColor: Colors.orange,
                radius: 18,
                child: const Icon(Icons.favorite_border, color: Colors.white, size: 18),
              ),
            ),
          ],
        ),
      ],
    );
  }
}