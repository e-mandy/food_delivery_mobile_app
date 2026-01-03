import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:food_delivery_mobile_app/details/details_page.dart';
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
  bool isDetailsOpen = false;

  void changedIndex(int typedIndex) {
    setState(() {
      currentIndex = typedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F8), // Light grey background
      body: SafeArea(
        child: Stack(
          children: [
            // Main Content
            IndexedStack(
              index: currentIndex,
              children: [
                HomeContent(
                  onOpenDetails: () {
                    setState(() {
                      isDetailsOpen = true;
                    });
                  },
                ),
                const Favorite(),
                const NotificationContent(),
                const Profile(),
              ],
            ),

            // Blur Overlay
            if (isDetailsOpen)
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    // allow closing by tapping outside? Maybe not required but good UX
                    // setState(() => isDetailsOpen = false);
                  },
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: 5.0),
                    duration: const Duration(milliseconds: 300),
                    builder: (context, value, child) {
                      return BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: value, sigmaY: value),
                        child: Container(
                          color: Colors.black.withOpacity(
                            0.0,
                          ), // Transparent container needed for hit testing sometimes, or just for filter?
                        ),
                      );
                    },
                  ),
                ),
              ),

            // Details Panel
            AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              top: isDetailsOpen ? 50 : MediaQuery.of(context).size.height,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height - 50, // Panel height
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                child: DetailsPage(
                  onClose: () {
                    setState(() {
                      isDetailsOpen = false;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      // We might want to hide the bottom nav when details is open, or blur it too?
      // "le home est mis en blur" -> usually implies everything below.
      // But BottomNavBar is usually outside body.
      // If we want to blur everything, we might need to put the Stack at the Scaffold level or overlay the whole screen.
      // For now, let's keep the nav bar unblurred or hide it?
      // Often panels cover the nav bar.
      // If `isDetailsOpen`, maybe hide bottom nav or just let the panel slide over it (using `height` above).
      // If we want the panel to be truly "over" everything, we should probably use a Stack that covers the whole screen including nav bar.
      // But `Scaffold.body` is below the app bar and above the bottom nav.
      // Let's try to see if we can overlay the bottom nav by moving the Stack up?
      // Or just hide the nav bar when details is open.
      bottomNavigationBar: isDetailsOpen
          ? null
          : Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, -5),
                  ),
                ],
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
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: "Search",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border),
                    label: "Favorites",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    label: "Profile",
                  ),
                ],
              ),
            ),
    );
  }
}
