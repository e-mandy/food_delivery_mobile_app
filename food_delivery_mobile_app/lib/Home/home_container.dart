import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/Home/components/category_pizza.dart';
import 'package:food_delivery_mobile_app/Home/components/list_pizza.dart';
import 'package:food_delivery_mobile_app/Home/components/sections.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    // Espacement standard entre les blocs
    const space = SizedBox(height: 25); 

    return SingleChildScrollView( 
      // Physics pour un scroll plus fluide sur iOS/Android
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Liste des catégories (Neapolitan, etc.)
            const CategoryList(),
            
            space,

            // 2. Barre de recherche CORRIGÉE (TextField + Micro dans une Row)
            Row(
              children: [
                Expanded( // L'Expanded est ici dans une Row (Calcul horizontal)
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "Search Pizza",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Le bouton Micro
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2), 
                  ),
                  child: const Icon(Icons.mic_none_outlined, color: Colors.black),
                ),
              ],
            ),

            space,

            // 3. Titre de la section
            const Text(
              "Classic Pizza", 
              style: TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 15),

            // 4. Liste horizontale des pizzas
            const ListPizza(), 

            space,

            // 5. Tes sections promo avec le Stack
            const Sections(),
            space,
            const Sections(),
            space,
            const Sections(),
            
            // Un dernier espace en bas pour ne pas que la barre de navigation cache le contenu
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}