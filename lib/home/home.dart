import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/favorites/favorite.dart';
import 'package:food_delivery_mobile_app/home/home_content.dart';
import 'package:food_delivery_mobile_app/notifications/notification_content.dart';
import 'package:food_delivery_mobile_app/profile/profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int currentIndex = 0;

  void changedIndex(int typedIndex){
    setState(() {
      currentIndex = typedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final whitePartColor = const Color.fromARGB(255, 239, 239, 239);

    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 166, 166, 166),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            primaryColor.withValues(alpha: 0.8),
            whitePartColor,
            whitePartColor,
            whitePartColor,
            whitePartColor,
            whitePartColor,
            whitePartColor,
            whitePartColor,
            whitePartColor,
          ]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: IndexedStack(
            index: currentIndex,
            children: [
              HomeContent(),
              Favorite(),
              NotificationContent(),
              Profile()
            ],
        )
        ),
      
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: primaryColor,
          onTap: changedIndex, 
          // Pour changer l'élément à sélectionner (commençant à 0 et allant à nbr item - 1)
          currentIndex: currentIndex,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
            BottomNavigationBarItem(icon: Icon( Icons.notifications), label: "Notifications"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ],
        ),
      ),
    );
  }
}  