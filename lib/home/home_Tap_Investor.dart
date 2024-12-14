import 'package:flutter/material.dart';
import 'package:innovahub_app/Constants/Colors_Constant.dart';

class HomeScreenInvestor extends StatefulWidget {
  HomeScreenInvestor({super.key});

  static const String routeName = 'home_investor';              // routeName:

  @override
  State<HomeScreenInvestor> createState() => _HomeScreenInvestorState();
}

class _HomeScreenInvestorState extends State<HomeScreenInvestor> {
  int select = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          mainAxisAlignment: MainAxisAlignment.center,
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
           
            const SizedBox(height: 25, ),

           const Padding(
              padding: EdgeInsets.only(left: 20),
              child:  Text('Necklaces',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Constant.mainColor),
              ),
            ),

            const SizedBox(height: 10),

           const Padding(
              padding:  EdgeInsets.only(left: 20),
              child:  Text('Handcrafted necklaces featuring deep blue Lapis Lazuli stones',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Constant.blackColorDark),
                    maxLines: 2,
              ),
            ),
          ],

        ),

      ),
    );
  }
}
