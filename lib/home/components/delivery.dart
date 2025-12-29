import 'package:flutter/material.dart';

class Delivery extends StatelessWidget {
  const Delivery({super.key});

  @override
  Widget build(BuildContext context) {
    final iconSize = 16.0;
    final iconColor = Theme.of(context).primaryColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Delivery to", style: TextStyle(
          fontSize: 12.0, color: Colors.grey
        )),
        Row(
          children: [
            Icon(Icons.place, color: iconColor, size: iconSize),
            Text("Sukabumi, Indonesia", style: TextStyle(
              fontWeight: FontWeight.w500
            )),
            Icon(Icons.arrow_drop_down, color: iconColor, size: iconSize)
          ],
        )
      ],
    );
  }
}