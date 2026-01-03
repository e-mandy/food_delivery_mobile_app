import 'package:flutter/material.dart';
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
            text: "Swipe to Explore",
            sliderButtonIcon: Text("Start",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
              )),
            elevation: 0,
            outerColor: const Color.fromARGB(255, 241, 241, 241),
            innerColor: Theme.of(context).primaryColor,
            textColor: Colors.black,
            textStyle: TextStyle(
              fontSize: 15
            ),
          ),
      ),
      );
  }
}