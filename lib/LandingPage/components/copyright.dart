import 'package:flutter/material.dart';

class Copyright extends StatelessWidget {
  const Copyright({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Positioned(
        bottom: 10,
        child: Text(text,
          style: TextStyle(
            fontSize: 17,
            decoration: TextDecoration.underline
          )
        )
      )
    );
  }
}