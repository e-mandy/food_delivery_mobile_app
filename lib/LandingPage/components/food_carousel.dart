import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/LandingPage/models/FoodCarouselItem.dart';

class FoodCarousel extends StatelessWidget {
  const FoodCarousel({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> FastFoodShows = [
      {'image': "assets/", "text": "The pizza Burger Pie"},
      {'image': "assets/", "text": "Le Burger Qui Tue"},
      {'image': "assets/", "text": "The Pepperoni You Want"},
      {'image': "assets/", "text": "La Salade Qui Sale Mdr"},
    ];
    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        children: [
          ...FastFoodShows.map((food){
            return FoodcarouselItem(image: food['image'], text: food['text']);
          })
        ],
      )
    );
  }
}