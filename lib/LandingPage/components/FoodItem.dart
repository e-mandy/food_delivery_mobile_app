import 'package:flutter/material.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({super.key, required this.name, required this.icon});

  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        Text(name)
      ],
    );
  }
}