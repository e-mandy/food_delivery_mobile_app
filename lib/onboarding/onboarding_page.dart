import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/home/home.dart';
import 'package:food_delivery_mobile_app/onboarding/slide_to_start.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late ScrollController _scrollController;
  final List<String> _pizzaTypes = [
    "Neapolitan",
    "Margherita",
    "Pepperoni",
    "Hawaiian",
    "Veggie",
    "Meat Lovers",
    "Sicilian",
    "Chicago Deep Dish",
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    // Start scrolling after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) => _startAutoScroll());
  }

  void _startAutoScroll() {
    // Animate to a very distant point over a long duration for constant speed linear feel
    // 50 pixels per second seems like a reasonable marquee speed
    // If we want it to run 'forever', we just pick a huge duration/distance
    // Ideally we'd reset, but for a short onboarding session, a long scroll is fine.
    // However, if the user interacts, we might want to pause or restart.
    // For a simple background marquee, we often ignore touch or re-trigger.

    // Check if attached to avoid errors
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(
          hours: 100,
        ), // Slower speed (approx 100x slower then previous if it was too fast)
        curve: Curves.linear,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Marquee Header
            SizedBox(
              height: 40,
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                physics:
                    const NeverScrollableScrollPhysics(), // User shouldn't hijack the marquee usually, or maybe they can? Let's disable manual scroll for "banner" feel.
                itemCount:
                    100000, // Large finite number to allow scrolling for a long time
                itemBuilder: (context, index) {
                  // Infinite scrolling by using modulo
                  final text = _pizzaTypes[index % _pizzaTypes.length];
                  // Highlight "Neapolitan" roughly every time it appears, OR just random colors?
                  // The original had Neapolitan as active. Let's make every 3rd one 'active' looking or just style them all nicely.
                  // User asked for "Neapolitan, Margherita ... is a marquee".
                  // Let's just alternate styles or keep them uniform.
                  // Original: Neapolitan (Active), others (Inactive).
                  // Let's make "Neapolitan" always active color if found, or just random?
                  // Let's keep the first item "Neapolitan" style logic but repeatedly?
                  // Actually, marquee implies all are equal usually. Let's style them all as 'options'.
                  final isExampleActive = text == "Neapolitan";

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: _buildHeaderItem(text, isExampleActive),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            const Divider(
              color: Colors.orange,
              thickness: 1,
              endIndent: 200,
            ), // Visual flair

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
                          style: TextStyle(color: Colors.deepOrange),
                        ),
                        TextSpan(text: "Delivered to Your Door!"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Order now for authentic, delicious\nFresh pizza!",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Bottom Area
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: SlideToStart(
                onSubmitted: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
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
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderItem(String text, bool isActive) {
    // If we want a uniform look for the marquee, we might remove the 'isActive' specific styling
    // or maybe highlight the text color.
    // For now, let's keep the logic passed from the builder.
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Always show icon for marquee loop richness? Or only for 'isActive'?
        // The prompt says "neopolitian, magherita .... is a marquee".
        // Let's add the pizza icon to all of them for better rhythm.
        const Icon(Icons.local_pizza, color: Colors.deepOrange, size: 16),
        const SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(
            color: isActive
                ? Colors.black
                : Colors.grey, // Bold/Black if 'active' (Neapolitan)
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
