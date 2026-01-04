import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery_mobile_app/Favoris/favoris.dart';
import 'package:food_delivery_mobile_app/Home/home_container.dart';

var indexRef = StateProvider((ref) => 0);

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(indexRef);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
            children: [
              TextSpan(text: "Eat Fresh "),
              TextSpan(text: "Pizza 🍕", style: TextStyle(color: Colors.deepOrange)),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade100,
              child: Stack(
                children: [
                  const Icon(Icons.notifications_none_outlined, color: Colors.black),
                  Positioned(
                    right: 2,
                    top: 2,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),

      extendBody: true,
        body: IndexedStack(
          index: ref.watch(indexRef),
          children: [
            HomeContainer(),
            Favoris()
          ],
        ), 
        


      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(120, 0, 120, 20), // Écarte des bords gauche, droite et bas
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30), // On arrondit fortement les coins
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white.withOpacity(0.7), // Obligatoire pour voir l'effet
              elevation: 0,
              selectedItemColor: Colors.deepOrange,
              currentIndex: currentIndex,
              unselectedItemColor: Colors.grey,
              onTap: (tapeindex) {
                ref.read(indexRef.notifier).state = tapeindex;
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favoris"),
                // BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
