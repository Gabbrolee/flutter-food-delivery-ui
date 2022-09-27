import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';

import '../models/order.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Recent Orders",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: 1.2),
          ),
        ),
        Container(
          height: 120,
          child: ListView.builder(
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: currentUser.orders.length,
              itemBuilder: (BuildContext context, int index) {
                Order order = currentUser.orders[index];
                return _buildRecentOrder(context, order);
              }),
        )
      ],
    );
  }

  Widget _buildRecentOrder(BuildContext context, Order order) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 320,
      decoration: BoxDecoration(
           color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: Colors.grey,
            width: 1.0
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                      order.food.imageUrl,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                  ),
                ),
              Expanded(
                  child:   Container (
                    margin: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          order.food.name,
                          style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis
                          ),
                        ),
                        SizedBox(height: 4.0,),
                        Text(
                          order.restaurant.name,
                          style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis
                          ),
                        ),
                        SizedBox(height: 4.0,),
                        Text(
                            order.date,
                            style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis
                            )
                        ),

                      ],
                    ),
                  ),
              )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
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
        ],
      ),
    );
  }
}
