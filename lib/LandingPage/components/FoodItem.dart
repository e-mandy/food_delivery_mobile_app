import 'package:flutter/material.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({super.key, required this.name, required this.icon});

  final String name;
  final IconData icon;

  String foodShow(){
    return name.toString();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Row(
      children: [
        Icon(icon, color: primaryColor,),
        SizedBox(width: 5),
        Text(name),
        SizedBox(width: 5),
        CircleAvatar(
          radius: 4,
          backgroundColor: primaryColor,
        ),
        SizedBox(width: 15)
      ],
    );
  }
}