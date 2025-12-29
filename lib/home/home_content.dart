import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/home/components/delivery.dart';

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
          )
        ],
      )
    );
  }
}