import 'package:flutter/material.dart';

class SwapBouton extends StatefulWidget {
  const SwapBouton({super.key});

  @override
  State<SwapBouton> createState() => _SwapBoutonState();
}

class _SwapBoutonState extends State<SwapBouton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true); // L'animation fait l'aller-retour

    _animation = Tween<double>(begin: 0, end: 8).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Bouton Start
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
              shape: const StadiumBorder(),
            ),
            child: const Text("Start", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),

          // Texte + Flèches animées
          Row(
            children: [
              const Text("Swipe to Explore", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
              const SizedBox(width: 5),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(_animation.value, 0),
                    child: child,
                  );
                },
                child: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}