
import 'package:flutter/material.dart';
import 'package:innovahub_app/core/Constants/Colors_Constant.dart';

class LogoutTextField extends StatelessWidget {
  const LogoutTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
          color: Constant.mainColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.login_outlined, color: Constant.whiteColor),
              SizedBox(width: 8),
              Text("Log Out",
              style: TextStyle(fontSize: 16, color: Constant.whiteColor)),
            ],
          ),
          onTap: () {},
        ),
      ),
    );
  }
}