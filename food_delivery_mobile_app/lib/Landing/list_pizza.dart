import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ListPizza extends StatelessWidget {
  const ListPizza({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,

        padding: const EdgeInsets.symmetric(
          horizontal: 3 ,
        ), // Espace au début et à la fin
        children: const [
          Padding(
            padding: EdgeInsets.only(right: 10), // Espace entre les pizzas
            child: PizzaImage(),
          ),

          Padding(padding: EdgeInsets.only(right: 15), child: PizzaImage()),

          Padding(padding: EdgeInsets.only(right: 15), child: PizzaImage()),

          Padding(padding: EdgeInsets.only(right: 15), child: PizzaImage()),
        ],
      ),
    );
  }
}

class PizzaImage extends StatelessWidget {
  const PizzaImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15), // On coupe les angles ici
          child: Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCe-SVDeyWFY7GnZ-C2D4lvLY8pCGartPo5UU5OqxEFoV7xH603sBihLoJVrfq6CiVNppx_pyNVAolgusuSVY204sA5lNBjddYUU8_zg&s",
            width: 200,
            height: 400,
            fit: BoxFit.cover, // Remplit tout le carré sans déformer
          ),
        ),

        Positioned(
          top: 20,
          left: 20,
          child: Text(
            "\tThe \n Pizza \n Burger \n Pie",
            style: TextStyle(
              color: Colors.white, 
              fontSize: 25,
              
            ),

          ).animate()
           .fade()
           .scaleXY(delay: 900.ms),
        ),
      ],
    );
  }
}
