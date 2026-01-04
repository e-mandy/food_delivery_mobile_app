import 'package:flutter/material.dart';

class FoodAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FoodAppBar({super.key});

  Size get preferredSize => new Size.fromHeight(50);
  @override
  Widget build(BuildContext context) {
    double titleSize = 20.0;
    return Container(
      padding: EdgeInsets.only(top: 20, left: 15, right: 15),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 3,
            children: [
              Text("Eat Fresh",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: titleSize
                ),
              ),
              Text("Pizza",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: titleSize
                )),
              Image(
                image: AssetImage("assets/logo_pizza.png"),
                width: 45,
              )
            ],
          ),
          Badge(
            label: Text("3"),
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 241, 241, 241),
              child: IconButton(
                onPressed: (){}, 
                icon: Icon(Icons.notification_add)
              ),
            ),
            
          )
        ],
      ),
    );
  }
}