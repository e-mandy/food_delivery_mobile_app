import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/LandingPage/models/FoodCarouselItem.dart';

class FoodCarousel extends StatefulWidget {
  const FoodCarousel({super.key});

  @override
  State<FoodCarousel> createState() => _FoodCarouselState();
}

class _FoodCarouselState extends State<FoodCarousel> {
  late ScrollController _scrollController;
  double _scrollOffset = 0.0;

  @override
  void initState(){
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener((){
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> FastFoodShows = [
      {'image': "assets/pizza.jpeg", "text": "The pizza Burger Pie"},
      {'image': "assets/burger.jpeg", "text": "Le Burger Qui Tue"},
      {'image': "assets/pepperoni.jpeg", "text": "The Pepperoni You Want"},
      {'image': "assets/salad.jpeg", "text": "La Salade Qui Sale Mdr"},
    ];

    double itemWidth = 250.0;
    double screenCenter = MediaQuery.of(context).size.width;

    // Pour écouter le scroll des éléments de la liste.
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) => true,
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          reverse: true,
          itemCount: FastFoodShows.length,
          controller: _scrollController,
          itemBuilder: (context, index){
            
            double itemCenter = (index * itemWidth) + (itemWidth / 2);
              
              // Distance entre le centre de l'item et ce que l'utilisateur voit (scroll + milieu écran)
              double distanceRelative = (itemCenter - (_scrollOffset + screenCenter));

              // On normalise la distance pour que 0 = centre, 1 = un item plus loin à droite
              double factor = distanceRelative / itemWidth;

            final food = FastFoodShows[index];
            return FoodcarouselItem(image: food['image']!, text: food['text']!);
          },
        )
      ),
    );
  }
}