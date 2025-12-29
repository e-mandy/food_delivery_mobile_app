import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/models/food.dart';

class FoodItem extends StatefulWidget {
  const FoodItem({super.key, required this.food});

  final Food food;

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final heightSpace = height / 20;
    double rating = 0.0;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.only(left: 8.0, top: heightSpace),
        
        
          width: width / 2.5,
          height: height / 4.5,
        
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
        
          child: Padding(
            padding: EdgeInsets.only(top: heightSpace * 2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(widget.food.name, 
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AnimatedRatingStars(
                      initialRating: rating,
                      minRating: 0.0,
                      maxRating: 5.0,
                      filledColor: Colors.amber,
                      emptyColor: Colors.grey,
                      filledIcon: Icons.star,
                      halfFilledIcon: Icons.star_half,
                      emptyIcon: Icons.star_border,
                      onChanged: (value) {
                        // Handle the rating change here
                        setState(() {
                          rating = rating;
                        });
                      },
                      displayRatingValue: true,
                      interactiveTooltips: true,
                      customFilledIcon: Icons.star,
                      customHalfFilledIcon: Icons.star_half,
                      customEmptyIcon: Icons.star_border,
                      starSize: 15.0,
                      animationDuration: Duration(milliseconds: 300),
                      animationCurve: Curves.easeInOut,
                      readOnly: false,
                    ),

                    Text(rating.toString(), style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.grey
                    )),

                    Text('1km 10min delivery', style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.grey
                    ))

                  ],
                )
              ],
            ),
          )
        ),
        Badge(
          alignment: Alignment.bottomRight,
          offset: Offset(-30, -30),
          backgroundColor: Colors.transparent,
          label: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: Text(widget.food.price.toString(), style: TextStyle(
              color: Colors.white,
              fontSize: 10.0
            )),
          ),
          child: CircleAvatar(
            radius: width/6,
            backgroundImage: NetworkImage(widget.food.url),
          ),
        )
      ],
    );
  }
}