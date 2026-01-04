import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery_mobile_app/Home/home.dart';
void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eat Fresh Pizza',
      theme: ThemeData(
        primaryColor:const Color(0xFFFF5722) ,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF5722),
          primary: const Color(0xFFFF5722),
          onPrimary: Colors.white,
        ),
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// class OnboardingScreen extends StatelessWidget {
//   const OnboardingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       // Suppression de l'AppBar pour un look plus "Onboarding" (plus d'espace)
//       body: SafeArea(
//         child: Column(
//           children: [
//             const SizedBox(height: 20),
            
//             // 1. La liste des pizzas (Le haut)
//             const ListPizza(), 
            
//             // Un ressort pour espacer
//             const Spacer(), 

//             // 2. Les textes (Le milieu)
//             const AfterCaroussel(), 
            
//             const Spacer(),

//             // 3. Le bouton et le swipe (Le bas)
//             const SwapBouton(),
            
//             const SizedBox(height: 10),
//           ],
//         ),
//       ),

//       bottomNavigationBar: const SizedBox(
//         height: 60,
//         child: Center(
//           child: Text(
//             "Privacy policy",
//             style: TextStyle(
//               color: Colors.grey,
//               fontSize: 14,
//               decoration: TextDecoration.underline,
//             ),
//           ),
//         ),
//       ),    
//     );
//   }
// }


