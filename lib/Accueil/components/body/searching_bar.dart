import 'package:flutter/material.dart';

class SearchingBar extends StatefulWidget {
  const SearchingBar({super.key});

  @override
  State<SearchingBar> createState() => _SearchingBarState();
}

class _SearchingBarState extends State<SearchingBar> {
  @override
  Widget build(BuildContext context) {

    final List<String> foodTitles = [
      // Pizzas
      "Pizza Margherita Classica",
      "Pizza Pepperoni Spicy",
      "Pizza Quattro Formaggi",
      "Pizza Regina (Jambon Champignons)",
      "Pizza Calzone Soufflée",
      "Pizza BBQ Chicken",
      "Pizza Truffe et Roquette",
      "Pizza Hawaïenne",
      "Pizza Veggie Garden",
      "Pizza Buffalo Mozzarella",
      
      // Fast-Food variés
      "Double Cheese Burger",
      "Bacon BBQ Burger",
      "Chicken Wrap Croustillant",
      "Tacos Lyonnais 3 Viandes",
      "Hot Dog New-Yorkais",
      "Fish and Chips",
      "Nuggets de Poulet (x10)",
      "Kebab Deluxe Sauce Blanche",
      "Sandwich Club Thon",
      "Bagel Saumon Crème"
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 20, top: 20),
      child: SearchAnchor.bar(
        barHintText: "Search Pizza",
        barLeading: Icon(Icons.search),
        barElevation: WidgetStateProperty.all(0),
        suggestionsBuilder: (context, SearchController controller){
          final userText = controller.text.toLowerCase();

          return foodTitles.where((food) => food.toLowerCase().contains(userText))
            .map((food) => ListTile(
              title: Text(food),
              onTap: (){
                controller.closeView(food);
              },
            ));
        },
      ),
    );
  }
}