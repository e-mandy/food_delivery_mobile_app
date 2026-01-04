import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/LandingPage/landing_page.dart';

import 'welcome_screen.dart'; 

void main() {
  runApp(const PizzaApp());
}

class PizzaApp extends StatelessWidget {
  const PizzaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eat Fresh Pizza',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const WelcomeScreen(), 
    );
  }
}