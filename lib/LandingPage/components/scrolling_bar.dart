import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/LandingPage/components/FoodItem.dart';
import 'dart:math' as math;

class ScrollingBar extends StatelessWidget {
  const ScrollingBar({super.key});

  @override
  Widget build(BuildContext context) {
    double angle = math.pi / 24.0;
    final List<Map<String, dynamic>> Foods = [
      {"name": "Burger Nexus", "icon": Icons.brunch_dining_rounded},
      {"name": "Pizza Pixel", "icon": Icons.local_pizza},
      {"name": "Wok & Roll", "icon": Icons.ramen_dining},
      {"name": "Green Loop", "icon": Icons.eco},
      {"name": "Sushi Drift", "icon": Icons.set_meal},
      {"name": "Ice Cream Byte", "icon": Icons.icecream}
  ];
  
  final secondaryColor = Color.fromARGB(255, 255, 154, 65);

    return Transform.rotate(
      angle: angle,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          margin: EdgeInsets.only(top: 35),
          padding: EdgeInsets.only(top: 25, bottom: 25, left: 12, right: 12),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: secondaryColor, width: 2.0),
              bottom: BorderSide(color: secondaryColor, width: 2.0)
            )
          ),
          child: Row(
            children: [
              ...Foods.map((food){
                return FoodItem(name: food['name'], icon: food['icon']);
              })
            ],
          )
        ),
      )
    );
  }
}