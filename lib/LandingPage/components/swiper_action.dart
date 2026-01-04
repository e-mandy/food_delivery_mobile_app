import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/Accueil/accueil.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SwiperAction extends StatefulWidget {
  const SwiperAction({super.key});

  @override
  State<SwiperAction> createState() => _SwiperActionState();
}

class _SwiperActionState extends State<SwiperAction> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: SlideAction(
            borderRadius: 50,
            sliderButtonIcon: Text("Start",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
              )),
            elevation: 0,
            outerColor: const Color.fromARGB(255, 241, 241, 241),
            innerColor: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.only(left: 130.0, right: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Swipe To Explore"),
                  Icon(Icons.keyboard_double_arrow_right)
                ],
              ),
            ),
            onSubmit: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Accueil())
              );
              return null;
            },
          ),
          
      ),
      );
  }
}