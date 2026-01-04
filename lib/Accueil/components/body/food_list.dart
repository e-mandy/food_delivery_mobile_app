import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/Accueil/components/partials/food_list_item.dart';

class FoodList extends StatefulWidget {
  const FoodList({super.key});

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  @override

  final List<String> foods = [
    "assets/food.jpeg",
    "assets/pizza_crepe.jpeg",
    "assets/pizza_hut.jpeg",
    "assets/salami_pizza.jpeg",
    "assets/rosso_pizza.jpeg"
  ];

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      padding: EdgeInsets.only(left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Classic Pizza",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: EdgeInsets.only(top: 15),
              height: 250,
              child: Row(
                spacing: 50,
                children: [
                  ...foods.map((food){
                    return FoodListItem(image: food);
                  })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}