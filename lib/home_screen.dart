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
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home, color: Colors.orange, size: 30),
          Icon(Icons.search, color: Colors.grey),
          Icon(Icons.favorite_border, color: Colors.grey),
          Icon(Icons.person_outline, color: Colors.grey),
        ],
      ),
    );
  }
}