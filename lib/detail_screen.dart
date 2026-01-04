import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String selectedSize = "Medium";
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildImageHeader(context),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildPizzaInfo(),
                        const SizedBox(height: 20),
                        const Text(
                          "Taille",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildSizeOption("Small", "6-7\""),
                            _buildSizeOption("Medium", "8-10\""),
                            _buildSizeOption("Large", "12-16\""),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Description",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "Une pizza artisanale préparée avec des ingrédients frais et une pâte pétrie à la main.",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: _buildBottomAction(), 
          ),
        ],
      ),
    );
  }



  Widget _buildImageHeader(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40), 
              bottomRight: Radius.circular(40)
            ),
            image: DecorationImage(
              image: NetworkImage('https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=1000'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 20,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        Positioned(
          top: 40,
          right: 20,
          child: CircleAvatar(
            backgroundColor: Colors.orange,
            child: const Icon(Icons.favorite, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildPizzaInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Pizza Pizza", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            Text("Italian Style", style: TextStyle(color: Colors.grey[600])),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text("\$13.21", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange)),
            Text("\$14.99", style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey[400])),
          ],
        ),
      ],
    );
  }

  Widget _buildSizeOption(String name, String detail) {
    bool isSelected = selectedSize == name;
    return GestureDetector(
      onTap: () => setState(() => selectedSize = name),
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange.withOpacity(0.1) : Colors.grey[50],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isSelected ? Colors.orange : Colors.transparent, width: 2),
        ),
        child: Column(
          children: [
            Icon(Icons.local_pizza, color: isSelected ? Colors.orange : Colors.grey),
            const SizedBox(height: 5),
            Text(name, style: TextStyle(fontWeight: FontWeight.bold, color: isSelected ? Colors.orange : Colors.black)),
            Text(detail, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomAction() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  if (quantity > 1) setState(() => quantity--);
                },
                icon: const Icon(Icons.remove),
              ),
              Text(
                quantity.toString().padLeft(2, '0'),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () => setState(() => quantity++),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("$quantity Pizzas ajoutées au panier !")),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            child: const Text(
              "Order Now",
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}