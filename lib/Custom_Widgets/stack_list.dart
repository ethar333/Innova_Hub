

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
        height:295,
        width: 200,
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
        left: 15,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Rucksack Embroidered Bag",
              style: TextStyle(fontSize: 13),
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Text("Made by", style: TextStyle(fontSize: 13,color: Constant.blackColorDark)),
                Text(" Amira", style: TextStyle(fontSize: 13, color: Constant.blueColor)),
              ],
            ),
          
            SizedBox(height: 8,),

            Text("\$28.00",style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),

            Row(
              children: [
                Icon(Icons.favorite_border_outlined),
                SizedBox(width: 15,),
                Icon(Icons.shopping_cart),
                SizedBox(width: 30,),
                CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.check,
                    color: Constant.whiteColor,
                    size: 14,
                  
                  ),
                ),
               SizedBox(width: 5,),
                Text(" In stock",style: TextStyle(fontSize: 12),)
              ],
            ),

            SizedBox(height: 8,),

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
                 Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
           
            SizedBox(width: 8,),

                Text("56890"),
              ],
            ),

            SizedBox(height: 15,)
          ],
        ),
      )
    ]);
  }
}