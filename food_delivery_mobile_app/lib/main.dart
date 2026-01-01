import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eat Fresh Pizza',
      theme: ThemeData(
        useMaterial3: true, //Afin d'utiliser les dernieres verision des widgets de MaterialApp
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xFFFF5722),
            primary: Color(0xFFFF5722),
            onPrimary: Colors.white,
            error: Colors.red
          ), //Pour la defintion des couleurs à utiliser dans le body

      ),
      home:OnboardingScreen() ,
    );
  }

}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // On s'assure que le fond est blanc
      body: SafeArea( // Empêche le contenu de passer sous l'encoche du téléphone
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centre verticalement pour le moment
          children: [
             AfterCaroussel(), // Widget juste avant le bouton de swap 
          ],
        ),
      ),
    );
  }
}

class AfterCaroussel extends StatelessWidget {
  const AfterCaroussel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment aligne les textes à gauche ou au centre
      crossAxisAlignment: CrossAxisAlignment.center, 
      children: [
        Text(
          "Authentic Pizza",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary, // Utilise ton orange du thème
          ),
        ),
        const SizedBox(height: 8), // Petit espace entre les deux textes
        const Text(
          "Delivered to Your Door!",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800, // Très gras comme sur l'image
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          "Order now for authentic, delicious\nFresh pizza!", // \n pour passer à la ligne
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

