
import 'package:flutter/material.dart';
import 'package:innovahub_app/Constants/Colors_Constant.dart';
import 'package:innovahub_app/Custom_Widgets/Stack_listCart.dart';
import 'package:innovahub_app/Custom_Widgets/stack_list.dart';
import 'package:innovahub_app/Custom_Widgets/stack_listHandmade.dart';

class HomeScreenUser extends StatelessWidget {
  const HomeScreenUser({super.key});

  static const String routeName = 'home_user'; // routeName:

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
       // mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 6),
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Constant.mainColor,
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                fillColor: Constant.whiteColor,
                filled: true,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Constant.greyColor2,
                ),
                hintText: 'Search any Product...',
                hintStyle:
                    const TextStyle(color: Constant.greyColor2, fontSize: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Constant.whiteColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Constant.whiteColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(color: Constant.whiteColor),
                ),
              ),
            ),
          ),

          const Padding(
            padding:  EdgeInsets.only(left: 10,top: 10),
            child:  Text(
              'Categories',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Constant.mainColor),
            ),
          ),
      
          const SizedBox(height: 10),
      
          Container(
            height: 75,
            width: double.infinity,
            color: const Color.fromARGB(255, 150, 200, 241),
            child: const Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Women",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Men",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Kids",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Fashion",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Watches",
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Blankets ",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Jewelry ",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Earrings ",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Drawing ",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Necklace ",
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 10,),
      
           Stack(
            children: [
              Container(
                child: Image.asset(
                  "assets/images/image-12.png",
                  fit: BoxFit.fill,
                ),
                width: double.infinity,
                height: 200,
              ),
              const  Positioned(
                top: 30,
                left: 10,
                child: Column(
                  children: [
                    Text(
                      "50-40 % off",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "Now in (product)",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      "All colours",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
              )
            ],
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               Stack(
                children: [
                  Container(
                    height: 170,
                    width: 120,
                    child: Image.asset("assets/images/image.png"),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 30,
                    child: Container(
                        width: 50,
                        decoration: BoxDecoration(
                          // Semi-transparent background for visibility
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Center(
                          child: Text(
                            "Art",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  )
                ],
              ),

             Stack(
                children: [
                  Container(
                    height: 150,
                    width: 120,
                    child: Image.asset("assets/images/image-1.png"),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 25,
                    child: Container(
                        width: 70,
                        decoration: BoxDecoration(
                          // Semi-transparent background for visibility
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Center(
                          child: Text(
                            "Jewelry",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  )
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: 150,
                    width: 120,
                    child: Image.asset("assets/images/image-2.png"),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 25,
                    child: Container(
                        width: 70,
                        decoration: BoxDecoration(
                          // Semi-transparent background for visibility
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Center(
                          child: Text(
                            "Bags",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ],
          ),
          
         Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  Container(
                    height: 170,
                    width: 120,
                    child: Image.asset("assets/images/image-3.png"),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 30,
                    child: Container(
                        width: 50,
                        decoration: BoxDecoration(
                          // Semi-transparent background for visibility
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Center(
                          child: Text(
                            "Home",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  )
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: 170,
                    width: 120,
                    child: Image.asset("assets/images/image-4.png",),
                 ),
                  Positioned(
                    bottom: 50,
                    left: 35,
                    child: Container(
                        width: 50,
                        decoration: BoxDecoration(
                          // Semi-transparent background for visibility
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Center(
                          child: Text(
                            "Carpts",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ],
          ),
          
          const Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                "Best Selling Products",
                style: TextStyle(color: Constant.blackColorDark,fontWeight: FontWeight.w400,fontSize: 18),
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
           ),
            child: ListView.separated(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const stacklist();
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(  width: 10, );
              },
            ),
          ),
      
          const Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                "Handcraft Carpets",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
      
          const SizedBox(
            height: 20,
          ),
         
          Container(
            height: 250,
            child: ListView.separated(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return stacklistcart();
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 7,
                );
              },
            ),
          ),

          //Explore other products
          const Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                "Shop Necklaces",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
      
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 250,
            child: ListView.separated(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return stacklisthandmade();
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 7,
                );
              },
            ),
          ),
        ]
      ),
    );
  }
}
