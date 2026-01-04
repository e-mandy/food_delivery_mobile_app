import 'package:flutter/material.dart';

class FoodCategorie extends StatefulWidget {
  const FoodCategorie({super.key});

  @override
  State<FoodCategorie> createState() => _FoodCategorieState();
}

class _FoodCategorieState extends State<FoodCategorie> {
  @override
  Widget build(BuildContext context) {

    final List<String> foodCategories = [
      "Neapolitan",
      "Margherita"
      "Pepperoni",
      "Quatres Saison",
      "Royale Pizza"
    ];

    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        children: [
        Expanded(
          child:
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 10,
                children: [
                  ...foodCategories.map((category){
                    return OutlinedButton(
                      onPressed: (){}, 
                      style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Colors.black
                      )
                    ),
                    child: Text(category, 
                      style: 
                        TextStyle(
                          color: Colors.black
                        )
                    ),
                    );
                  }),
                ],
              )
            )
        )
      ],),
    );;
  }
}