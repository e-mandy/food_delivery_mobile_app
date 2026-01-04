import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/LandingPage/components/copyright.dart';
import 'package:food_delivery_mobile_app/LandingPage/components/food_carousel.dart';
import 'package:food_delivery_mobile_app/LandingPage/components/landing_title.dart';
import 'package:food_delivery_mobile_app/LandingPage/components/scrolling_bar.dart';
import 'package:food_delivery_mobile_app/LandingPage/components/swiper_action.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ScrollingBar(),
              SizedBox(height: 60),
              FoodCarousel(),
              LandingTitle(),
              SizedBox(height: 35),
              SwiperAction(),
              SizedBox(height: 50),
              Copyright(text: "Privacy policy")
            ],
          ),
        ),
      )
    );
  }
}