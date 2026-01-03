import 'package:flutter/material.dart';

class FoodcarouselItem extends StatelessWidget {
  const FoodcarouselItem({super.key, required this.image, required this.text});
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image), 
              fit: BoxFit.cover,
            ),
          borderRadius: BorderRadius.all(Radius.circular(20))
          )
        ),
        Positioned(
          width: 300 * 0.7,
          top: 10,
          left: 10,
          child: Text(text.toUpperCase(), 
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              height: 1,
              color: Colors.white,
              fontFamily: "Schoolbell-Regular",
              wordSpacing: 300,
            ),
          )
        )
      ]
    );
  }
}