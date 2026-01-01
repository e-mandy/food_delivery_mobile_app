import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/home/home.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Header decorations - approximating the design's top "tabs"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildHeaderItem("Neapolitan", true),
                  _buildHeaderItem("Margherita", false),
                  _buildHeaderItem("Pepperoni", false),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Divider(color: Colors.orange, thickness: 1, endIndent: 200), // Visual flair

            const Spacer(),

            // Main Image Card
            Expanded(
              flex: 5,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/pizza_burger_pie.png'),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 20,
                      left: 20,
                      child: SizedBox(
                        width: 150,
                        child: Text(
                          "The\nPizza\nBurger\nPie",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            height: 0.9,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 30),

            // Title and Subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                            text: "Authentic Pizza\n",
                            style: TextStyle(color: Colors.deepOrange)),
                        TextSpan(text: "Delivered to Your Door!"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Order now for authentic, delicious\nFresh pizza!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            
            const Spacer(),

            // Bottom Area
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Text(
                      "Start",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Text(
                    "Swipe To Explore",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                ],
              ),
            ),
            
            TextButton(
              onPressed: () {}, 
              child: const Text(
                "Privacy policy",
                style: TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.underline,
                ),
              )
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderItem(String text, bool isActive) {
    return Row(
      children: [
        if (isActive) 
          const Icon(Icons.local_pizza, color: Colors.deepOrange, size: 16),
        const SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.black : Colors.grey,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
