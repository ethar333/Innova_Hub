import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innovahub_app/core/Constants/Colors_Constant.dart';
import 'package:innovahub_app/home/add_Tap_owner.dart';
import 'package:innovahub_app/home/Deals/deal_tap_owner.dart';
import 'package:innovahub_app/home/cubit/owner_home_layout_cubit.dart';
import 'package:innovahub_app/home/home_owner.dart';
import 'package:innovahub_app/home/model/owner_home_layout_model.dart';
import 'package:innovahub_app/home/search_Tap.dart';
import 'package:innovahub_app/profiles/profile_tap_owner.dart';

class HomeScreenOwner extends StatefulWidget {
  const HomeScreenOwner({super.key});

  static const String routeName = 'home_owner'; // routeName of this screen:

  @override
  State<HomeScreenOwner> createState() => _HomeScreenOwnerState();
}

class _HomeScreenOwnerState extends State<HomeScreenOwner> {
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
              backgroundImage: AssetImage('assets/images/owner1.png'),
            ),
          ),
        ],
      ),
      body: BlocBuilder<OwnerHomeLayoutCubit, OwnerHomeLayoutState>(
        builder: (context, state) {
          return PageView.builder(
            controller: OwnerHomeLayoutCubit.get(context).pageController,
            onPageChanged: (value) {
              OwnerHomeLayoutCubit.get(context).changePage(value);
            },
            itemBuilder: (context, index) {
              return OwnerHomeLayoutModel.screens[index];
            },
          );
        },
      ),
      bottomNavigationBar:
          BlocBuilder<OwnerHomeLayoutCubit, OwnerHomeLayoutState>(
        builder: (context, state) {
          return BottomNavigationBar(
            items: OwnerHomeLayoutModel.items,
            currentIndex: OwnerHomeLayoutCubit.get(context).currentIndex,
            onTap: (index) {
              OwnerHomeLayoutCubit.get(context).changePage(index);
            },
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black,
            selectedLabelStyle: const TextStyle(
              fontSize: 16,
            ),
          );
        },
      ),
    );
  }
}
