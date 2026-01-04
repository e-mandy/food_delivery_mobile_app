import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/Accueil/components/AppBar/food_app_bar.dart';
import 'package:food_delivery_mobile_app/Accueil/components/body/food_categorie.dart';
import 'package:food_delivery_mobile_app/Accueil/components/body/food_list.dart';
import 'package:food_delivery_mobile_app/Accueil/components/body/searching_bar.dart';
import 'package:food_delivery_mobile_app/Accueil/components/body/trending_food.dart';
import 'package:food_delivery_mobile_app/Accueil/components/bottomBar/food_bottom_bar.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FoodAppBar(),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
        child: Column(
          children: [
            SearchingBar(),
            FoodCategorie(),
            FoodList(),
            TrendingFood()

          ],
        )
      )),
      bottomNavigationBar: BottomAppBar(
        child: FoodBottomBar(),
      )
    );
  }
}