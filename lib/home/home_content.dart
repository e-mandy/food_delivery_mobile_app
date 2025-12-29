import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/home/components/category.dart';
import 'package:food_delivery_mobile_app/home/components/delivery.dart';
import 'package:food_delivery_mobile_app/home/components/food_item.dart';
import 'package:food_delivery_mobile_app/samples/food_samples.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(height: 32);
    var backgroundColor = Colors.white;

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Delivery(),
          spacer,
          SearchBar(
            leading: Icon(Icons.search),
            hintText: "What did you eat today ?",
            backgroundColor: WidgetStateProperty.all(backgroundColor),
          ),
          spacer,
          Category(),
          spacer,
          ListTile(
            title: Text("Popular food", style: TextStyle(
              fontWeight: FontWeight.bold
            )),
            trailing: GestureDetector(
              onTap: (){
                // CONTRIBUTIONS : Ouvrir la page de toutes les cards
              },
              child: Text("See All", style: TextStyle(
                color: Colors.grey
              ),),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                foodSamples.map((food){
                  return FoodItem(food: food);
                }).toList(),
            )
          )
        ],
      )
    );
  }
}