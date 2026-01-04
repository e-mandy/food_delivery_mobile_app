import 'dart:ui'; // Needed for ImageFilter
import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/Accueil/components/body/searching_bar.dart';
import 'detail_screen.dart';

/// App bar d'accueil principal de l'application de livraison de pizzas
/// Affiche un catalogue de pizzas, une barre de recherche et une navigation inférieure
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Espacement supérieur
              const SizedBox(height: 20),

              // En-tête avec titre et icône de notification
              _buildHeader(),

              const SizedBox(height: 25),

              // Barre de recherche de pizzas
              SearchingBar(),

              const SizedBox(height: 25),

              // Catégories de pizzas (Neapolitan, Margherita, Pepperoni)
              _buildCategories(),

              const SizedBox(height: 30),

              // Titre "Classic Pizza"
              const Text(
                "Classic Pizza",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 30),

              // Titre "Trending Pizza"
              const Text(
                "Trending Pizza",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // Bannière de pizza tendance avec promotion
              _buildTrendingPizza(),

              // Espacement pour éviter que le contenu soit caché par la barre de navigation flottante
              const SizedBox(height: 100),

              const SizedBox(height: 15),

              // Grille de cartes de pizzas (deux cartes côte à côte)
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

      // Barre de navigation personnalisée avec effet flottant
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  /// Construit l'en-tête avec le titre "Eat Fresh Pizza" et l'icône de notification
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Titre avec "Eat Fresh" en noir et "Pizza " en orange
        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            children: [
              TextSpan(text: "Eat Fresh "),
              TextSpan(
                text: "Pizza ",
                style: TextStyle(color: Colors.orange),
              ),
            ],
          ),
        ),
        // Icône de cloche pour les notifications
        const Icon(Icons.notifications_none_outlined, size: 28),
      ],
    );
  }

  /// Construit la barre de recherche avec icône de recherche et microphone
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

  /// Construit les boutons de catégories de pizzas
  Widget _buildCategories() {
    return Row(
      children: [
        _buildCategoryChip("Neapolitan", true),
        _buildCategoryChip("Margherita", false),
        _buildCategoryChip("Pepperoni", false),
      ],
    );
  }

  /// Crée un chip de catégorie avec fond orange si sélectionné
  /// [label] : Texte du chip
  /// [isSelected] : Indique si le chip est sélectionné
  Widget _buildCategoryChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? Colors.orange : Colors.grey[300]!,
        ),
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

  /// Construit une carte de produit pizza avec image, boutons d'action
  /// [imageUrl] : URL de l'image de la pizza
  /// [context] : Contexte pour la navigation
  Widget _buildPizzaCard(String imageUrl, BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _showDetailsPanel(context),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            children: [
              // Image de la pizza avec coins arrondis
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(imageUrl, height: 100, fit: BoxFit.cover),
              ),
              const SizedBox(height: 10),
              // Boutons d'action
              Row(
                children: [
                  // Bouton "Ajouter au panier"
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Add To Cart",
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      ),
                    ),
                  ),
                  // Bouton "Commander maintenant" en orange
                  ElevatedButton(
                    onPressed: () => _showDetailsPanel(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                    ),
                    child: const Text(
                      "Order Now",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fonction pour afficher le panel de détails avec flou d'arrière-plan
  void _showDetailsPanel(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Details",
      barrierColor: Colors.black.withOpacity(
        0.1,
      ), // Légère ombre noire en plus du flou si désiré
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Stack(
          children: [
            // Effet de flou sur tout l'arrière-plan
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Flou gaussien
                child: Container(
                  color: Colors
                      .transparent, // Nécessaire pour que le filtre s'applique correctement
                ),
              ),
            ),
            // Le contenu de la page de détails qui arrive du bas
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height:
                    MediaQuery.of(context).size.height *
                    0.85, // Prend 85% de la hauteur
                child: const DetailsScreen(),
              ),
            ),
          ],
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        // Animation de glissement vers le haut
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut)),
          child: child,
        );
      },
    );
  }

  /// Construit la barre de navigation inférieure personnalisée avec effet flottant
  /// Affiche les icônes : Accueil, Recherche, Favoris, Profil
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
          // Bouton Accueil actif (avec fond orange)
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
                Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Icône de recherche
          const Icon(Icons.search, color: Colors.grey),
          // Icône de favoris
          const Icon(Icons.favorite_border, color: Colors.grey),
          // Icône de profil
          const Icon(Icons.person_outline, color: Colors.grey),
        ],
      ),
    );
  }
}

/// Construit la bannière "Trending Pizza" avec promotion et image
/// Affiche un message promotionnel avec image de pizza positionnée à droite
/// et un bouton favori en haut à gauche
Widget _buildTrendingPizza() {
  return Container(
    height: 180,
    width: double.infinity,
    decoration: BoxDecoration(
      color: const Color(0xFFFFF9E5), // Couleur de fond jaune clair
      borderRadius: BorderRadius.circular(30),
    ),
    child: Stack(
      children: [
        // Contenu texte avec le message promotionnel
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Titre de la promotion
              const Text(
                "Get A\nSlice Of\nCheese",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 10),
              // Sous-titre avec les détails de la livraison
              Text(
                "Delivery Available 24/7",
                style: TextStyle(color: Colors.grey[700], fontSize: 12),
              ),
            ],
          ),
        ),

        // Image de pizza positionnée à droite
        Positioned(
          right: -20,
          top: 10,
          bottom: 10,
          child: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTs13kyoQZGlwBCUi73VW5UJvtV93NT5iEonQ&s',
            fit: BoxFit.contain,
          ),
        ),

        // Bouton favori en haut à gauche
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
