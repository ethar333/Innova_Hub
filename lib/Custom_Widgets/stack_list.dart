import 'package:flutter/material.dart';
import 'package:innovahub_app/Custom_Widgets/quick_alert.dart';
import 'package:innovahub_app/core/Api/cart_services.dart';
import 'package:innovahub_app/core/Constants/Colors_Constant.dart';
import 'package:innovahub_app/Models/product_response.dart';
import 'package:quickalert/models/quickalert_type.dart';

// ignore: camel_case_types, must_be_immutable
class stacklist extends StatelessWidget {
  stacklist({super.key, required this.product});

  ProductResponse product; // object from model to represent data:

  //final CartService cartService = CartService(); // object:
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: const EdgeInsets.only(left: 10),
        height: 340,
        width: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
      ),
      Positioned(
        left: 35,
        child: Image.network(
          product.productImage,
          fit: BoxFit.contain,
          height: 180,
          width: 180,
        ),
      ),
      Positioned(
        bottom: 10,
        left: 25,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Text("Made by ",
                    style: TextStyle(
                        fontSize: 13, color: Constant.blackColorDark)),
                Text(product.authorName,
                    style: const TextStyle(
                        fontSize: 13, color: Constant.blueColor)),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text("\$${product.price.toStringAsFixed(2)}"),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Icon(Icons.favorite_border_outlined),

                const SizedBox(
                  width: 15,
                ),

                GestureDetector(
                  onTap: () {
                    addToCart(product.productId, 1).then((value) {
                      if (value) {
                        quickAlert(
                            context: context,
                            title: "Added to cart successfully",
                            type: QuickAlertType.success);
                      } else {
                        quickAlert(
                            context: context,
                            title: "Error adding to cart",
                            type: QuickAlertType.error);
                      }
                    }); // call the method to add to cart
                  },
                  child: const Icon(Icons.shopping_cart, color: Colors.black),
                ),

                //(child: Icon(Icons.shopping_cart)),

                const SizedBox(
                  width: 50,
                ),
                const CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.check,
                    color: Constant.whiteColor,
                    size: 14,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  " In stock",
                  style:
                      TextStyle(fontSize: 13, color: Constant.blackColorDark),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
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
                SizedBox(
                  width: 8,
                ),
                Text("56890"),
              ],
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      )
    ]);
  }
}
