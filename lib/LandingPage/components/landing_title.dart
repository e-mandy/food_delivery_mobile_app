import 'package:flutter/material.dart';

class LandingTitle extends StatelessWidget {
  const LandingTitle({super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * 0.8,
      child: Center(
        child: Column(
          children: [
            Text("Authentic Pizza",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              )
            ),
            Text("Deliver to Your Door",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30.0,
                fontFamily: 'poppins',
                wordSpacing: 2
              )
            ),
            SizedBox(height: 20),
            Text("Order now for authentic, decilious Fresh pizza !",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}