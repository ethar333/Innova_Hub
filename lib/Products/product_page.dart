
import 'package:flutter/material.dart';
import 'package:innovahub_app/core/Constants/Colors_Constant.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  static const String routeName = 'product_page'; // route Name pf this page:

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int select = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.whiteColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Innova',
          style: TextStyle(
              color: Constant.blackColorDark,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 24,
              backgroundImage:
                  AssetImage('assets/images/image-13.png'), // ضع الصورة هنا
            ),
          ),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border_outlined,
              ),
              label: "Wishlist",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
              ),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search_outlined,
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: "Profile",
            ),
          ],
          currentIndex: select,
          onTap: (index) {
            select = index;
            setState(() {});
          },
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          selectedLabelStyle: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Constant.mainColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(80),
                ),
              ),
              width: double.infinity,
              height: 70,
              child: const Padding(
                padding: EdgeInsets.all(18),
                child: Text(
                  'Necklaces',
                  style: TextStyle(
                      fontSize: 24,
                      color: Constant.whiteColor,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/images/Necklace1.png",
                  fit: BoxFit.cover,
                  width: 350,
                ),
              ),
            ),
            SizedBox(
              height: 75,
              //width: 70,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: List.generate(
                  4,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/images/Necklace2.png", // استبدلها بالصور الفعلية
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      /*const CircleAvatar(backgroundColor: Colors.grey, radius: 30,
                      backgroundImage: AssetImage('assets/images/owner.png'),
                      ),*/
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          //color: Colors.grey, // لون الخلفية في حال لم يتم تحميل الصورة
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/owner.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text("Owner Name",
                          style: TextStyle(
                              color: Constant.blackColorDark,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.message,
                          color: Constant.mainColor,
                          size: 25,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Lapis Set, Necklace, ring, earrings lightweight",
                    style: TextStyle(
                        color: Constant.blackColorDark,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "\$70.00",
                    style: TextStyle(
                        color: Constant.blackColorDark,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Full Set without Silver Necklace",
                    style: TextStyle(
                        color: Constant.blackColorDark,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  IconButton(
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Constant.blackColorDark,
                        size: 30,
                      ),
                      onPressed: () {}),
                  const Spacer(),
                  const Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star_border,
                            color: Constant.greyColor,
                          ),
                          Icon(
                            Icons.star_border,
                            color: Constant.greyColor,
                          ),
                          Icon(
                            Icons.star_border,
                            color: Constant.greyColor,
                          ),
                          Icon(
                            Icons.star_border,
                            color: Constant.greyColor,
                          ),
                          Icon(
                            Icons.star_border,
                            color: Constant.greyColor,
                          ),
                        ],
                      ),
                      Text(
                        " 0 Review(s)",
                        style: TextStyle(color: Constant.greyColor4),
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
                color: Constant.whiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Available quantity: 2', // text:
                    style: TextStyle(
                      color: Constant.greyColor4,
                      fontSize: 15,
                      //fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: Constant.whiteColor,
                      border: Border.all(
                        color: Constant.greyColor4,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove,
                        size: 30,
                        color: Constant.mainColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    "1",
                    style: TextStyle(color: Constant.mainColor, fontSize: 25),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: Constant.whiteColor,
                      border: Border.all(
                        color: Constant.greyColor4,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        size: 30,
                        color: Constant.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Constant.mainColor,
                          minimumSize: const Size(1, 60)),
                      child: const Text(
                        "Buy Now",
                        style:
                            TextStyle(color: Constant.whiteColor, fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Constant.whiteColor,
                          minimumSize: const Size(1, 60)),
                      child: const Text(
                        "Add to cart",
                        style: TextStyle(
                            color: Constant.black2Color, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
           
           /* const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Comments",
                    style: TextStyle(
                        color: Constant.blackColorDark,
                        fontWeight: FontWeight.w500,
                        fontSize: 16)),
                SizedBox(height: 10),
              ],
            ),*/
          ],
        ),
      ),
    );
  }
}
