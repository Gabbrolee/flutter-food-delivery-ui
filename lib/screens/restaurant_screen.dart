import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/widgets/rating_stars.dart';

import '../models/food.dart';

class RestaurantScreen extends StatefulWidget {
  Restaurant restaurant;
  RestaurantScreen({required this.restaurant});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image.asset(
                  widget.restaurant.imageUrl,
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  IconButton(
                      onPressed: ()=> Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios),
                      iconSize: 30.0,
                      color: Colors.white,
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.favorite),
                    iconSize: 30.0,
                    color: Theme.of(context).primaryColor
                  )
                ],),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        widget.restaurant.name,
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    const Text(
                        "0.2 miles away",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400
                      ),
                    )
                  ],
                ),
                RatingStars(widget.restaurant.rating),
                SizedBox(height: 8.0,),
                Text(
                    widget.restaurant.address,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                 padding: EdgeInsets.symmetric(horizontal: 30.0),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  onPressed: (){},
                  child: const Text(
                      "Reviews",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0
                    ),
                  )
              ),
              FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  onPressed: (){},
                  child: const Text(
                    "Contact",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0
                    ),
                  )
              )
            ],
          ),
          SizedBox(height: 10.0,),
          const Text(
              "Menu",
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: 10.0,),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(10.0),
             crossAxisCount: 2,
              children: List.generate(widget.restaurant.menu.length, (index){
                Food food = widget.restaurant.menu[index];
                return _buildMenuItem(food);
              }),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMenuItem(Food food) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 175,
            width: 175,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(food.imageUrl),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Container(
            height: 175,
            width: 175,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black87.withOpacity(0.3),
                  Colors.black54.withOpacity(0.3),
                  Colors.black38.withOpacity(0.3),
                ],
                stops: const [0.1, 0.4, 0.6, 0.9] // position of each color in colors above
              )
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                food.name,
                style: const TextStyle(
                  fontSize: 24.0,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              Text (
                "\$${food.price}",
                style: const TextStyle(
                    fontSize: 18.0,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              )
            ],
          ),
          Positioned(
              bottom: 15.0,
              right: 5.0,
              child: Container(
                width: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).primaryColor
                ),
                child: IconButton(
                  icon: Icon(Icons.add, color: Colors.white),
                  iconSize: 30,
                  onPressed: (){},
                ),
              )
          )
        ],
      ),
    );
  }
}
