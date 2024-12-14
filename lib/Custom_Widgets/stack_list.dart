

import 'package:flutter/material.dart';
import 'package:innovahub_app/Constants/Colors_Constant.dart';

class stacklist extends StatelessWidget {
  const stacklist({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: const EdgeInsets.only(left: 25),
        //padding: EdgeInsets.only(left: 20),
        height: 246,
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
      ),
      Image.asset(
        "assets/images/image-8.png",
      ),
     const Positioned(
        bottom: 10,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "RucksackEmbroideredBag",
              style: TextStyle(fontSize: 12),
            ),
            Text("Made by Amira", style: TextStyle(fontSize: 15)),
            Text("\$28.00"),
            Row(
              children: [
                Icon(Icons.favorite_border_outlined),
                Icon(Icons.shopping_cart),
                SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  radius: 11,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.check,
                    color: Constant.whiteColor,
                  
                  ),
                ),
                Text(" In stock")
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Text("4521")
              ],
            )
          ],
        ),
      )
    ]);
  }
}