import 'package:flutter/material.dart';

class FoodAppBar extends StatefulWidget implements PreferredSizeWidget {
  const FoodAppBar({super.key});

  Size get preferredSize => new Size.fromHeight(50);
  @override
  State<FoodAppBar> createState() => _FoodAppBarState();
}

class _FoodAppBarState extends State<FoodAppBar> {

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}