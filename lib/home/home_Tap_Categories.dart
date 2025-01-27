
import 'package:flutter/material.dart';
import 'package:innovahub_app/Constants/Colors_Constant.dart';
import 'package:innovahub_app/Custom_Widgets/stack_listHandmade.dart';

class HomeScreenCategories extends StatefulWidget {
  HomeScreenCategories({super.key});

  static const String routeName = 'categories';    // routeName:

  @override
  State<HomeScreenCategories> createState() => _HomeScreenInvestorState();
}

class _HomeScreenInvestorState extends State<HomeScreenCategories> {
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
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Necklaces',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Constant.mainColor),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Handcrafted necklaces featuring deep blue Lapis Lazuli stones',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Constant.blackColorDark),
                maxLines: 2,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Constant.mainColor,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(60)),
              ),
              width: double.infinity,
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Search by name..",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          // Added Expanded here
                          child: SizedBox(
                            height: 30,
                            child: TextField(
                              decoration: InputDecoration(
                                hintStyle: const TextStyle(
                                    color: Colors.grey), // Hint text color
                                prefixIcon: const Icon(Icons.search,
                                    color: Colors.grey), // Icon color
                                filled: true,
                                fillColor:
                                    Colors.white, // TextField background color
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none, // Remove border
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Range From",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        const SizedBox(width: 45),
                        SizedBox(
                          height: 30,
                          width: 80,
                          child: TextField(
                            decoration: InputDecoration(
                              hintStyle: const TextStyle(
                                  color: Colors.grey), // Hint text color
                              // Icon color
                              filled: true,
                              fillColor:
                                  Colors.white, // TextField background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none, // Remove border
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          "to",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          height: 30,
                          width: 80,
                          child: TextField(
                            decoration: InputDecoration(
                              hintStyle: const TextStyle(
                                  color: Colors.grey), // Hint text color
                              // Icon color
                              filled: true,
                              fillColor:
                                  Colors.white, // TextField background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none, // Remove border
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Search by location..",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          // Added Expanded here
                          child: SizedBox(
                            height: 30,
                            child: TextField(
                              decoration: InputDecoration(
                                hintStyle: const TextStyle(
                                    color: Colors.grey), // Hint text color
                                prefixIcon: const Icon(Icons.search,
                                    color: Colors.grey), // Icon color
                                filled: true,
                                fillColor:
                                    Colors.white, // TextField background color
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none, // Remove border
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                "Find out more and give us more \n power to complete our journey.",
                style: TextStyle(
                    color: Constant.mainColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            
            const SizedBox(height: 20,),
        
             Container(
              height: 500,
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,       // Number of columns in the grid
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 4,   // Aspect ratio of each grid item
                )
                ,
                itemCount: 20, // Total number of items in the grid
                itemBuilder: (context, index) {
                  return stacklisthandmade();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



