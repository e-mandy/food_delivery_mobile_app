import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/LandingPage/components/food_carousel.dart';
import 'package:food_delivery_mobile_app/LandingPage/components/scrolling_bar.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ScrollingBar(),
            SizedBox(height: 20),
            FoodCarousel()
          ],
        ),
      )
    );
  }
}