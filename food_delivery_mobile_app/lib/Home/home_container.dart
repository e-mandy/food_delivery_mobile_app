import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/Home/components/list_pizza.dart';
import 'package:food_delivery_mobile_app/Home/components/sections.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 25); 

    return SingleChildScrollView( // Permet de scroller toute la page si besoin
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Classic Pizza", 
              style: TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            space,
            const ListPizza(), 
            space,
            const Sections(),
            space,
            const Sections(),
            space,
            const Sections(),
          ],
        ),
      ),
    );
  }
}