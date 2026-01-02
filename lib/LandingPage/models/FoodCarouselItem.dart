import 'package:flutter/material.dart';

class FoodcarouselItem extends StatelessWidget {
  const FoodcarouselItem({super.key, required this.image, required this.text});
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          width: 250,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)
          )
        ),
        Positioned(
          width: 50,
          top: 10,
          left: 10,
          child: Text(text, style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),)
        )
      ]
    );
  }
}