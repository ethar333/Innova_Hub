
import 'package:flutter/material.dart';
import 'package:innovahub_app/Constants/Colors_Constant.dart';
import 'package:innovahub_app/Custom_Widgets/Stack_listCart.dart';
import 'package:innovahub_app/Custom_Widgets/container_owner.dart';
import 'package:innovahub_app/Custom_Widgets/stack_listHandmade.dart';

class HomeOwner extends StatelessWidget {
  const HomeOwner({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
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
          const SizedBox(
            height: 15,
          ),

          Padding(
            padding: const EdgeInsets.all(13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/owner1.png",
                ),
                const SizedBox(
                  width: 10,
                ),
                const Expanded(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mohamed Ali',
                        style: TextStyle(
                          color: Constant.blackColorDark,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Constant.blue3Color,
                            child: Icon(
                              Icons.check,
                              color: Constant.whiteColor,
                              size: 18,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Verified',
                            style: TextStyle(
                              color: Constant.greyColor3,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ID:2333669591',
                      style: TextStyle(
                        color: Constant.greyColor,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Constant.white2Color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Estimated Balance', // text:
                      style: TextStyle(
                        color: Constant.blackColorDark,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '152,326.23 EGP', // text:
                      style: TextStyle(
                        color: Constant.purpuleColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '≈ \$3025.37', // text:
                      style: TextStyle(
                        color: Constant.blackColorDark,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      //margin: EdgeInsets.only(left: 30),
                      //padding: const EdgeInsets.only(left: 10, right: 10),
                      width: 90,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Constant.blueColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'Withdraw',
                          style: TextStyle(
                            color: Constant.whiteColor,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      //margin: EdgeInsets.only(left: 30),
                      //padding: const EdgeInsets.only(left: 10, right: 10),
                      width: 90,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Constant.blueColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'Deposit',
                          style: TextStyle(
                            color: Constant.whiteColor,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Constant.white2Color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Constant.mainColor, // لون الـ border
                      width: 3, // سمك الـ border
                    ),
                  ),
                  child: const CircleAvatar(
                      backgroundColor: Constant.whiteColor,
                      radius: 15,
                      child: Icon(
                        Icons.add,
                        color: Constant.mainColor,
                        size: 30,
                      )),
                ), // Icon:

                const Text(
                  'Publish New Product             ', // text:
                  style: TextStyle(
                    color: Constant.blackColorDark,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Latest product overview', // text:
              style: TextStyle(
                color: Constant.blackColorDark,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // const SizedBox(height: 10,),
          
         const ContainerOwner(),

          const SizedBox(
            height: 4,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Constant.mainColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(60),
                  topLeft: Radius.circular(60)),
            ),
            width: double.infinity,
            height: 105,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'You Can start ur investment Easily',
                      style: TextStyle(
                          fontSize: 14,
                          color: Constant.whiteColor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Go Deals Now',
                      style: TextStyle(
                        fontSize: 14,
                        color: Constant.whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
            ),
          ),

          const SizedBox(
            height: 15,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  Container(
                    height: 120,
                    width: 110,
                    child: Image.asset(
                      "assets/images/image.png",
                      fit: BoxFit.fill,
                    ),
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
                    margin: EdgeInsets.all(10),
                    height: 120,
                    width: 110,
                    child: Image.asset(
                      "assets/images/image-1.png",
                      fit: BoxFit.fill,
                    ),
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
                    //margin: EdgeInsets.all(12),
                    height: 120,
                    width: 110,
                    child: Image.asset(
                      "assets/images/image-2.png",
                      fit: BoxFit.fill,
                    ),
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
                    height: 130,
                    width: 120,
                    child: Image.asset(
                      "assets/images/image-3.png",
                      fit: BoxFit.fill,
                    ),
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
                    height: 140,
                    width: 120,
                    child: Image.asset(
                      "assets/images/image-4.png",
                      fit: BoxFit.fill,
                    ),
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

          const SizedBox(
            height: 10,
          ),

          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // SizedBox(width: 10, ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Handcraft Carpets",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Constant.blackColorDark),
                ),
              ),
              SizedBox(
                width: 140,
              ),
              Text(
                "Show All",
                style: TextStyle(
                    color: Constant.blueColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
              ),
            ],
          ),

          const SizedBox(
            height: 10,
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
                  width: 15,
                );
              },
            ),
          ),

          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 15,
              ),
              Text(
                "Shop Necklaces",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Constant.blackColorDark),
              ),
              SizedBox(
                width: 160,
              ),
              Text(
                "Show All",
                style: TextStyle(
                    color: Constant.blueColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
              ),
            ],
          ),

          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 12),
            height: 250,
            child: ListView.separated(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return stacklisthandmade();
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 12,
                );
              },
            ),
          ),

          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
