# Documentation Technique - Food Delivery Mobile App

Cette documentation couvre la structure, les fonctionnalités et l'architecture technique de l'application de livraison de pizzas.

## 📱 Aperçu du Projet
C'est une application Flutter mobile simulant un service de commande de pizzas. Elle se distingue par une interface utilisateur soignée, des animations fluides (marquee, transitions) et une navigation moderne.

## 📂 Structure du Code
L'application est organisée dans le dossier `lib` :

- **`main.dart`** : Point d'entrée de l'application. Configure le thème et lance `WelcomeScreen`.
- **`welcome_screen.dart`** : Page d'accueil (Landing Page).
- **`home_screen.dart`** : Écran principal avec catalogue et recherche.
- **`detail_screen.dart`** : Panneau de détails du produit (overlay).
- **`LandingPage/`** : Composants spécifiques à la page de bienvenue.
  - `components/`
    - `scrolling_bar.dart` : Le marquee (bandeau défilant) animé.
    - `food_carousel.dart` : Carrousel d'images.
    - `landing_title.dart` : Titre principal.
    - `copyright.dart` : Mentions légales.
- **`Accueil/`** : Composants utilisés dans l'écran principal (barre de recherche, etc.).

## 🚀 Fonctionnalités Clés

### 1. Écran de Bienvenue (Landing Page)
**Fichier :** [welcome_screen.dart](lib/welcome_screen.dart)
- **Marquee Animé :** Une barre horizontale qui défile automatiquement à l'infini montrant les catégories (Burger, Pizza, Wok...). Implémenté dans [scrolling_bar.dart](lib/LandingPage/components/scrolling_bar.dart).
- **Carrousel :** Présentation visuelle des produits phares.
- **Swipe to Explore :** Bouton glissant pour entrer dans l'application (`slider_button`).

### 2. Écran Principal (Dashboard)
**Fichier :** [home_screen.dart](lib/home_screen.dart)
- **Navigation Flottante :** Barre de navigation en bas avec effet d'ombre porté.
- **Catégories :** Filtres sélectionnables (Neapolitan, Margherita...).
- **Trending Pizza :** Bannière promotionnelle.
- **Catalogue :** Grille de pizzas.
- **Interaction :**
  - Cliquer sur une pizza ou sur "Order Now" déclenche l'ouverture du **Panneau de Détails**.
  - L'arrière-plan devient flou (`BackdropFilter`) pour mettre en avant le panneau.

### 3. Panneau de Détails (Product Overlay)
**Fichier :** [detail_screen.dart](lib/detail_screen.dart)
- **Architecture :** Ce n'est pas une nouvelle page (`Scaffold`), mais un `Widget` affiché via `showGeneralDialog`.
- **Fonctions :**
  - Affichage grand format de l'image.
  - Sélection de la taille (Small, Medium, Large).
  - Ajustement de la quantité (+/-).
  - Bouton d'ajout au panier.

## 🛠 Architecture Technique

### Navigation
La navigation entre l'accueil et le détail utilise une transition personnalisée :
```dart
showGeneralDialog(
  transitionBuilder: (context, animation, ...) {
    return SlideTransition(...); // Animation du bas vers le haut
  },
  pageBuilder: (...) {
    return Stack(
      children: [
        BackdropFilter(...), // Effet de flou
        DetailsScreen(),     // Le contenu
      ]
    );
  }
)
```

### Animation (Marquee)
Le composant `ScrollingBar` utilise un `Timer.periodic` couplé à un `ListView.builder` infini et un `ScrollController` pour créer une animation de défilement continu fluide et automatique.

### Dépendances Externes
- `slider_button` : Pour le bouton de déverrouillage sur l'écran d'accueil.
- `flutter_svg` : (Potentiellement utilisé pour des icônes vectorielles).
