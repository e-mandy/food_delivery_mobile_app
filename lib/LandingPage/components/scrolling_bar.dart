import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/LandingPage/components/FoodItem.dart';
import 'dart:math' as math;

class ScrollingBar extends StatefulWidget {
  const ScrollingBar({super.key});

  @override
  State<ScrollingBar> createState() => _ScrollingBarState();
}

class _ScrollingBarState extends State<ScrollingBar> {
  late ScrollController _scrollController;
  late Timer _timer;
  final double _scrollSpeed = 2.0; // Vitesse de défilement (pixels par tick)

  final List<Map<String, dynamic>> _foods = [
    {"name": "Burger Nexus", "icon": Icons.brunch_dining_rounded},
    {"name": "Pizza Pixel", "icon": Icons.local_pizza},
    {"name": "Wok & Roll", "icon": Icons.ramen_dining},
    {"name": "Green Loop", "icon": Icons.eco},
    {"name": "Sushi Drift", "icon": Icons.set_meal},
    {"name": "Ice Cream Byte", "icon": Icons.icecream},
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // Démarrer l'auto-scroll après la construction du widget
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  void _startAutoScroll() {
    // Timer qui s'exécute périodiquement pour faire avancer le scroll
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (_scrollController.hasClients) {
        double newOffset = _scrollController.offset + _scrollSpeed;

        // Si on atteint la fin de la zone scrollable (virtuellement infinie ici mais on check quand même),
        // on reset (ou on laisse le builder gérer l'infini).
        // Avec ListView.builder infini, on peut juste scroller indéfiniment.
        // Cependant, pour éviter les soucis de maxScrollExtent sur très longue durée,
        // on peut vérifier si on dépasse une grande valeur et reset sans animation (jumpTo)
        // si le contenu est parfaitement dupliqué.

        // Ici, on fait simple : scroll continu.
        _scrollController.jumpTo(newOffset);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double angle = math.pi / 24.0;
    final secondaryColor = const Color.fromARGB(255, 255, 154, 65);

    return Transform.rotate(
      angle: angle,
      child: Container(
        height: 120, // Hauteur fixe nécessaire pour le ListView horizontal
        margin: const EdgeInsets.only(top: 35, bottom: 30),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: secondaryColor, width: 2.0),
            bottom: BorderSide(color: secondaryColor, width: 2.0),
          ),
        ),
        // Utilisation de ListView.builder pour un défilement infini
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          // itemCount: null, // null signifie infini
          physics:
              const NeverScrollableScrollPhysics(), // Empêche l'utilisateur de scroller manuellement pour ne pas casser l'auto-scroll
          itemBuilder: (context, index) {
            // Modulo pour répéter la liste indéfiniment
            final food = _foods[index % _foods.length];
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 25.0,
              ),
              child: FoodItem(name: food['name'], icon: food['icon']),
            );
          },
        ),
      ),
    );
  }
}
