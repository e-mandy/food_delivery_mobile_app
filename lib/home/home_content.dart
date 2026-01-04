import 'dart:async';
import 'package:flutter/material.dart';

class HomeContent extends StatefulWidget {
  final VoidCallback onOpenDetails;
  const HomeContent({super.key, required this.onOpenDetails});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  final List<Map<String, dynamic>> _trendingPizzas = [
    {
      'title': 'Get A\nSlice',
      'color': const Color(0xFFFFF8E1),
      'image': 'assets/images/trending_pizza.png',
    },
    {
      'title': 'Pizza\nParty',
      'color': const Color(0xFFFFE0E0),
      'image': 'assets/images/trending_pizza.png',
    },
    {
      'title': 'Fresh\nBaked',
      'color': const Color(0xFFE0F7FA),
      'image': 'assets/images/trending_pizza.png',
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        final nextPage = (_currentPage + 1) % _trendingPizzas.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Eat Fresh Pizza 🍕",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: const Icon(Icons.notifications_none),
            ),
          ],
        ),

        const SizedBox(height: 20),

        // Search Bar
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
            ],
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: "Search Pizza",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              icon: Icon(Icons.search, color: Colors.grey),
              suffixIcon: Icon(Icons.mic, color: Colors.grey),
            ),
          ),
        ),

        const SizedBox(height: 25),

        // Categories
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildCategoryChip("Neapolitan", true),
              _buildCategoryChip("Margherita", false),
              _buildCategoryChip("Pepperoni", false),
              _buildCategoryChip("Hawaiian", false),
            ],
          ),
        ),

        const SizedBox(height: 25),

        // Classic Pizza Section
        const Text(
          "Classic Pizza",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),

        SizedBox(
          height: 260,
          child: ListView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            children: const [
              ClassicPizzaCard(
                image: "assets/images/classic_pizza.png",
                name: "Margaret Pizza",
                price: "\$13.21",
                isOrderNow: false,
              ),
              ClassicPizzaCard(
                image: "assets/images/classic_pizza_vegetable.png",
                name: "Vegetable Pizza",
                price: "\$11.50",
                isOrderNow: true,
              ),
              ClassicPizzaCard(
                image: "assets/images/classic_pizza_pepperoni.png",
                name: "Pepperoni Pizza",
                price: "\$14.50",
                isOrderNow: false,
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Trending Pizza",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "See all",
              style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),

        const SizedBox(height: 15),

        // Trending Pizza Carousel
        SizedBox(
          height: 220,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _trendingPizzas.length,
            itemBuilder: (context, index) {
              final pizza = _trendingPizzas[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GestureDetector(
                  onTap: widget.onOpenDetails,
                  child: Stack(
                    children: [
                      Container(
                        height: 220,
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: pizza['color'],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Colors.deepOrange,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              pizza['title'],
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                height: 1.1,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Text(
                                      "Home",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  const Icon(
                                    Icons.search,
                                    size: 22,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 12),
                                  const Icon(
                                    Icons.favorite_border,
                                    size: 22,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 12),
                                  const Icon(
                                    Icons.person_outline,
                                    size: 22,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: -40,
                        top: 0,
                        bottom: 0,
                        child: Hero(
                          tag: 'trending_pizza_$index',
                          child: Image.asset(
                            pizza['image'],
                            height: 180,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 15),

        // Page Indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _trendingPizzas.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentPage == index ? 24 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _currentPage == index
                    ? Colors.deepOrange
                    : Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),

        const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepOrange : Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            if (!isSelected)
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5),
          ],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class ClassicPizzaCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final bool isOrderNow;

  const ClassicPizzaCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.isOrderNow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 15),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          // Card Content
          Container(
            height: 200,
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.fromLTRB(12, 50, 12, 12),
            decoration: BoxDecoration(
              color: const Color(0xFF2D2D2D), // Dark grey background
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align text to left
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  name,
                  maxLines: 2,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(color: Colors.black, blurRadius: 10)],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isOrderNow
                              ? Colors.deepOrange
                              : Colors.white,
                          foregroundColor: isOrderNow
                              ? Colors.white
                              : Colors.black,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 0,
                          ),
                          minimumSize: const Size(0, 36),
                        ),
                        child: Text(
                          isOrderNow ? "Order Now" : "Add To Cart",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Image floating on top
          Positioned(
            top: 0,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 15,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Image.asset(
                image,
                height: 110,
                width: 110,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
