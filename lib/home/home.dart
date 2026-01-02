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
      backgroundColor: const Color(0xFFF5F5F8), // Light grey background
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: const [
            HomeContent(),
            Favorite(),
            NotificationContent(),
            Profile()
          ],
        )
      ),
      
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, -5),
            )
          ]
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: changedIndex, 
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), 
              label: "Home"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search), 
              label: "Search"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), 
              label: "Favorites"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), 
              label: "Profile"
            )
          ],
        ),
      ),
    );
  }
}  