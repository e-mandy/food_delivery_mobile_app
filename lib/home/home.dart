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
    return Scaffold(
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
        selectedItemColor: Colors.deepOrange,
        onTap: changedIndex, 
        // Pour changer l'élément à sélectionner (commençant à 0 et allant à nbr item - 1)
        currentIndex: currentIndex,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notifications"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
      ),
    );
  }
}  