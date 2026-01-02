import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/models/CategoryModel.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({super.key, required this.category});
  final CategoryModel category;

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool categoryState = false;

  void changeCategoryState(){
    setState(() {
      categoryState = !categoryState;
    });
  }

  @override
  Widget build(BuildContext context) {
    var backgroundColor = Theme.of(context).primaryColor;
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
          onTap: changeCategoryState,
          child: SizedBox(
            height: 120,
            width: width / 4,
            child: Column(
              children: [
                CircleAvatar(
                  radius: width / 12,
                  backgroundColor: categoryState ? backgroundColor : Colors.white,
                  child: Icon(widget.category.icon, color: categoryState ? Colors.white : null,),
                ),
                Text(widget.category.name, style: TextStyle(
                  fontWeight: FontWeight.w400
                ))
              ],
            )
          )
          );
  }
}