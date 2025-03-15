
import 'package:flutter/material.dart';
import 'package:innovahub_app/Custom_Widgets/Data_textfield.dart';
import 'package:innovahub_app/core/Constants/Colors_Constant.dart';

class CheckoutAddress extends StatefulWidget {
  const CheckoutAddress({super.key});

  static const String routeName = 'address';

  @override
  State<CheckoutAddress> createState() => _CheckoutAddressState();
}

class _CheckoutAddressState extends State<CheckoutAddress> {
  int select = 0;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.white3Color,
      appBar: AppBar(
        //shadowColor: Constant.whiteColor,
        backgroundColor: Constant.whiteColor,
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
              backgroundImage: AssetImage('assets/images/image-13.png'),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DataTextField(hint:'First Name'),
            DataTextField(hint:'Last Name'),
            DataTextField(hint:'Street Address'),
            DataTextField(hint:'Apartment, Suite, etc..'),
            DataTextField(hint:'Email'),
            DataTextField(hint:'Phone'),
            DataTextField(hint:'City'),
            DataTextField(hint:'Zip code'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildOutlinedButton('Back', () {
                  // Handle back action
                }),
                 
                 const SizedBox(width: 2, ),
                _buildElevatedButton('Save', () {
                  // Handle save action
                }),
              ],
            ),
          ],
          
        ),
      ),
      
    );
  }


  static Widget _buildOutlinedButton(String text, VoidCallback onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: Constant.whiteColor,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        side: const BorderSide(color: Constant.greyColor2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        minimumSize: const Size(170, 50),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Constant.mainColor, fontSize: 15),
      ),
    );
  }

  static Widget _buildElevatedButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        backgroundColor: Constant.mainColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        minimumSize: const Size(170, 50),
      ),
      child: const Text(
        'Save',
        style: TextStyle(fontSize: 18, color: Constant.whiteColor),
      ),
    );
  }
}
