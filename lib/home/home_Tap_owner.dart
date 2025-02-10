
import 'package:flutter/material.dart';
import 'package:innovahub_app/Constants/Colors_Constant.dart';
import 'package:innovahub_app/home/add_Tap_owner.dart';
import 'package:innovahub_app/home/Deals/deal_tap_owner.dart';
import 'package:innovahub_app/home/home_owner.dart';
import 'package:innovahub_app/home/search_Tap.dart';
import 'package:innovahub_app/profiles/profile_tap_owner.dart';

class HomeScreenOwner extends StatefulWidget {
  const HomeScreenOwner({super.key});

  static const String routeName = 'home_owner'; // routeName of this screen:

  @override
  State<HomeScreenOwner> createState() => _HomeScreenOwnerState();
}

class _HomeScreenOwnerState extends State<HomeScreenOwner> {
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
                  AssetImage('assets/images/owner1.png'), // ضع الصورة هنا
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
                Icons.add,
              ),
              label: "Add",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.trending_up,
              ),
              label: "Deals",
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

      body: tabsOwner[select],

    );
  }


  List<Widget> tabsOwner = [
    
    HomeOwner(),
    AddOwner(),
    DealOwner(),
    SearchTap(),
    ProfileOwner(firstnameController: '',lastnameController: '',emailController: '',passwordController: '',cityController: '',phoneNumber: '',),

  ];



}

