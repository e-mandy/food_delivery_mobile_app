import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/LandingPage/models/FoodCarouselItem.dart';
import 'dart:math' as math;

class FoodCarousel extends StatefulWidget {
  const FoodCarousel({super.key});

  @override
  State<FoodCarousel> createState() => _FoodCarouselState();
}

class _FoodCarouselState extends State<FoodCarousel> {

  final PageController _controller = PageController(
    initialPage: 0,
    viewportFraction: 0.7
  );



  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> fastFoodShows = [
      {'image': "assets/pizza.jpeg", "text": "The pizza Burger Pie"},
      {'image': "assets/burger.jpeg", "text": "Le Burger Qui Tue"},
      {'image': "assets/pepperoni.jpeg", "text": "The Pepperoni You Want"},
      {'image': "assets/salad.jpeg", "text": "La Salade Qui Sale Mdr"},
    ];

    // Pour écouter le scroll des éléments de la liste.
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      height: 320,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: _controller,
        itemCount: fastFoodShows.length,
        itemBuilder: (context, index){
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child){

              double page = 0;
              double angle = 0.0;
              if(_controller.position.hasContentDimensions){
                page = _controller.page!;
                angle = index - page;
              }else{
                page = _controller.initialPage.toDouble();
              }


              return Transform.rotate(
                angle: (angle.toInt() < 0) ? -(math.pi / 48) : (angle.toInt() > 0) ? (math.pi / 48) : (angle.toInt() == 0) ? 0 : null!,
                child: child,
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(child: 
                FoodcarouselItem(image: fastFoodShows[index]['image']!, text: fastFoodShows[index]['text']!)
              ),
            ),
          );
        },
      )
    );
  }
}