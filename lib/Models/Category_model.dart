
import 'package:flutter/material.dart';
import 'package:innovahub_app/Constants/Colors_Constant.dart';

class CategoryChip extends StatelessWidget {
  final String label;

  const CategoryChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
       color: Constant.mainColor,
        //color: Colors.teal[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label),
    );
  }
}