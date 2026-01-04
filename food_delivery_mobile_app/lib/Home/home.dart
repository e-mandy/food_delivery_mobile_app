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
        title: const Text("Eat Fresh Pizza" , style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,)), 
        actions: const [
          Icon(Icons.notifications, shadows: [Shadow(color: Colors.black12)],), 
          SizedBox(width: 15), // Un petit espace pour ne pas coller au bord
        ],
        
      ),


      extendBody: true,
      body: SafeArea(
        child: IndexedStack(
          index: ref.watch(indexRef),
          children: [
            HomeContainer(),
            Favoris()
          ],
        ) 
        
      ),

      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: BottomNavigationBar(
      //     type: BottomNavigationBarType.fixed,
      //     selectedItemColor: iconColor,
      //     unselectedItemColor: Colors.grey,
      //     currentIndex: currentIndex,
      //     onTap: (click) {
      //       ref.read(indexRef.notifier).state = click;
      //     },
      //     items: [
      //       BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //       // BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
      //       BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favoris"),
      //       // BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
      //     ],
      //   ),
      // ),


      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(120, 0, 120, 20), // Écarte des bords gauche, droite et bas
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30), // On arrondit fortement les coins
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white, // Obligatoire pour voir l'effet
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
