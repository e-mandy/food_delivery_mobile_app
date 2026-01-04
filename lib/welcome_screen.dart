import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/LandingPage/components/copyright.dart';
import 'package:food_delivery_mobile_app/LandingPage/components/food_carousel.dart';
import 'package:food_delivery_mobile_app/LandingPage/components/landing_title.dart';
import 'package:food_delivery_mobile_app/LandingPage/components/scrolling_bar.dart';
import 'home_screen.dart'; 
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
              
              // Scrolling bar de la première section de la landing page
              ScrollingBar(),

              const SizedBox(height: 16),
              
              // Section carousel de la landing page
              FoodCarousel(),

              const SizedBox(height: 16),
              
              LandingTitle(),

              const SizedBox(height: 24),

              _buildSwipeButton(context),
           
              const SizedBox(height: 20),

              Copyright(text: "Privacy Policy")
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        text,
        style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }

  // Widget pour le bouton slider
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

        label: const Text(
          "Swipe To Explore",
          style: TextStyle(
              color: Color(0xff4a4a4a), 
              fontWeight: FontWeight.w500, 
              fontSize: 17
          ),
        ),
        icon: const Center(
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 20.0,
          ),
        ),
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