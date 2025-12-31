import 'package:flutter/material.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Le SafeArea est crucial pour ne pas coller à l'encoche du haut
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              
              // --- 1. HEADER ---
              _buildHeader(),
              
              const SizedBox(height: 25),
              
              // --- 2. BARRE DE RECHERCHE ---
              _buildSearchBar(),
              
              const SizedBox(height: 25),
              
              // --- 3. FILTRES (CATÉGORIES) ---
              _buildCategories(),
              
              const SizedBox(height: 30),
              
              // --- 4. SECTION "CLASSIC PIZZA" ---
              const Text(
                "Classic Pizza",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              // ... après le bloc Classic Pizza
const SizedBox(height: 30),
const Text(
  "Trending Pizza",
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
const SizedBox(height: 15),
_buildTrendingPizza(), // Appel de notre nouveau widget
const SizedBox(height: 100), // Espace pour ne pas être caché par la barre de menu
              const SizedBox(height: 15),
              
              // Ici on utilise une Row pour mettre deux cartes côte à côte
              Row(
                children: [
                  _buildPizzaCard(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4T5DnkHaRm_TuNPFySDqHUlRlUL5ptclqNA&s",
                    context,
                  ),
                  const SizedBox(width: 15),
                  _buildPizzaCard(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4T5DnkHaRm_TuNPFySDqHUlRlUL5ptclqNA&s",
                    context,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      
      // La barre de navigation du bas (on la fera plus tard, mais on prépare l'espace)
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // --- WIDGETS DE COMPOSANTS ---

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            children: [
              TextSpan(text: "Eat Fresh "),
              TextSpan(text: "Pizza 🍕", style: TextStyle(color: Colors.orange)),
            ],
          ),
        ),
        const Icon(Icons.notifications_none_outlined, size: 28),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: const TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: Colors.grey),
          hintText: "Search Pizza",
          border: InputBorder.none,
          suffixIcon: Icon(Icons.mic_none, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    // Liste simple pour l'instant
    return Row(
      children: [
        _buildCategoryChip("Neapolitan", true),
        _buildCategoryChip("Margherita", false),
        _buildCategoryChip("Pepperoni", false),
      ],
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isSelected ? Colors.orange : Colors.grey[300]!),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildPizzaCard(String imageUrl, BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10, spreadRadius: 5),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(imageUrl, height: 100, fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Add To Cart", style: TextStyle(fontSize: 10, color: Colors.black)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DetailsScreen()),
  );
},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                  ),
                  child: const Text("Order Now", style: TextStyle(fontSize: 10, color: Colors.white)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

 Widget _buildBottomNav() {
  return Container(
    margin: const EdgeInsets.all(20), // Crée l'effet "flottant"
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(40),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 20,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Bouton Home actif
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            children: [
              Icon(Icons.home, color: Colors.white),
              SizedBox(width: 8),
              Text("Home", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        const Icon(Icons.search, color: Colors.grey),
        const Icon(Icons.favorite_border, color: Colors.grey),
        const Icon(Icons.person_outline, color: Colors.grey),
      ],
    ),
  );
}
}

Widget _buildTrendingPizza() {
  return Container(
    height: 180,
    width: double.infinity,
    decoration: BoxDecoration(
      color: const Color(0xFFFFF9E5), // Le jaune pâle de la maquette
      borderRadius: BorderRadius.circular(30),
    ),
    child: Stack(
      children: [
        // Texte et Infos
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Get A\nSlice Of\nCheese",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Delivery Available 24/7",
                style: TextStyle(color: Colors.grey[700], fontSize: 12),
              ),
            ],
          ),
        ),
        
        // Image de la pizza (à droite)
        Positioned(
          right: -20,
          top: 10,
          bottom: 10,
          child: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTs13kyoQZGlwBCUi73VW5UJvtV93NT5iEonQ&s', // Pizza ronde sans fond
            fit: BoxFit.contain,
          ),
        ),

        // Le bouton Favori (Cœur)
        Positioned(
          top: 15,
          left: 15,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.favorite, color: Colors.white, size: 18),
          ),
        ),
      ],
    ),
  );
}