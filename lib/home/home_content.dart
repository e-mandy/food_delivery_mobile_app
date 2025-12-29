import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/home/components/delivery.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Delivery()
        ],
      )
    );
  }
}