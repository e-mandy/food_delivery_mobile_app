import 'package:flutter/material.dart';

class FoodListItem extends StatelessWidget {
  const FoodListItem({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image))
          ),
        )
      ],
    );
  }
}