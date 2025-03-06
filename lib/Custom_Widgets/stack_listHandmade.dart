

import 'package:flutter/material.dart';
import 'package:innovahub_app/core/Constants/Colors_Constant.dart';
import 'package:innovahub_app/Models/product_response.dart';

// ignore: must_be_immutable, camel_case_types
class stacklisthandmade extends StatelessWidget {

  ProductResponse product;     // object:

  stacklisthandmade({super.key,  required this.product});
  @override

  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        //margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        height: 330,
        width: 200,
      ),
    
      ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.network( product.productImage,    
        fit: BoxFit.cover,
        height: 180, 
        width: 200,
        ),
      ),
      
       Positioned(
        bottom: 40,
        left: 10,

        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: const TextStyle(fontSize: 12),
            ),
    
            const SizedBox(height: 8,),
    
             Row(
              children: [
                const Text("Made by ", style: TextStyle(fontSize: 13,color: Constant.blackColorDark)),
                Text( product.authorName, style: const TextStyle(fontSize: 13, color: Constant.blueColor)),
    
              ],
            ),
            const SizedBox(height: 8,),
    
             Text("\$${product.price}",style: const TextStyle(fontWeight: FontWeight.bold)),
            
            const SizedBox(height: 10,),
            const Row(
              children: [
                Icon(Icons.favorite_border_outlined),
                SizedBox(width: 15,),
                Icon(Icons.shopping_cart),
                SizedBox(
                  width: 30,
                ),
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
                Text(" In stock",style: TextStyle(fontSize: 13,color: Constant.blackColorDark),)
              ],
            ),
           
          ],
        ),
      )
    ]);
  }
}