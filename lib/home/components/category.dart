import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/home/components/category_item.dart';
import 'package:food_delivery_mobile_app/models/CategoryModel.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    
    List categories = <CategoryModel>[
      CategoryModel(name: "Salad", icon: Icons.local_pizza),
      CategoryModel(name: "Rice", icon: Icons.rice_bowl),
      CategoryModel(name: "Burger", icon: Icons.fastfood),
      CategoryModel(name: "Baba Milk", icon: Icons.local_drink),
      CategoryModel(name: "Juice", icon: Icons.restaurant)
    ];

    return SizedBox(
      height: 128,
      width: width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: categories.map((category){
          return CategoryItem(category: category,);
        
        }).toList(),
      ),
    ); 
  }
}