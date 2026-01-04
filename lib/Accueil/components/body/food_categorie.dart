import 'package:flutter/material.dart';

class FoodCategorie extends StatefulWidget {
  const FoodCategorie({super.key});

  @override
  State<FoodCategorie> createState() => _FoodCategorieState();
}

class _FoodCategorieState extends State<FoodCategorie> {
  @override
  Widget build(BuildContext context) {

    final List<Map<String, bool>> foodCategories = [
      {"Margherita": true},
      {"Pepperoni": false},
      {"Végétarien": false},
      {"Quatres Saisons": false},
      {"Royale Pizza": false},
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
                        
                        backgroundColor: category.values.first ? Theme.of(context).primaryColor : Colors.transparent,
                        side: BorderSide(
                          color: category.values.first ? Colors.white : Colors.black
                        )
                      ),
                      child: Text(category.keys.first, 
                        style: TextStyle(
                          color: category.values.first ? Colors.white : Colors.black
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