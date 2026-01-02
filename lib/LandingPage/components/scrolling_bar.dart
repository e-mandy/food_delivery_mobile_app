import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'dart:math' as math;

class ScrollingBar extends StatelessWidget {
  const ScrollingBar({super.key});

  @override
  Widget build(BuildContext context) {
    double angle = 10.0;
    final List<Map<String, dynamic>> Foods = [
      {"name": "Burger Nexus", "icon": Icons.lunch_dining},
      {"name": "Pizza Pixel", "icon": Icons.local_pizza},
      {"name": "Wok & Roll", "icon": Icons.ramen_dining},
      {"name": "Green Loop", "icon": Icons.eco},
      {"name": "Sushi Drift", "icon": Icons.set_meal},
      {"name": "Ice Cream Byte", "icon": Icons.icecream}
  ];


    return Transform.rotate(
      angle: math.pi / 24,
      child: Column(
        children: [
          Text("Je suis ici"),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.black),
                bottom: BorderSide(color: Colors.black)
              )
            ),
            height: 100,
            child: Marquee(
              text: "Je ne sus pas encore mlaobezibfzovibrovberfoierbvorebverorergvr"
            ),
          )
      ]
      )
    );
  }
}