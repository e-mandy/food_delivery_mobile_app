import 'package:flutter/material.dart';

class FoodListItem extends StatelessWidget {
  const FoodListItem({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
              alignment: Alignment.center
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          child: Container(
            padding: EdgeInsets.only(left: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                SizedBox(
                  width: 110,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: (){}, 
                    child: Text("Add to Cart", style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),)
                  ),
                ),
                SizedBox(
                  width: 110,
                  height: 45,
                  child: ElevatedButton( 
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.deepOrange),
                    ),
                    onPressed: (){}, 
                    child: Text("Order Now", style: TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),)
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}