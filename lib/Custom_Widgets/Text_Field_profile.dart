

import 'package:flutter/material.dart';
import 'package:innovahub_app/Constants/Colors_Constant.dart';

class TextFieldProfile extends StatelessWidget {

   TextEditingController controller = TextEditingController();
   final String label;
   final bool obscureText;

   TextFieldProfile({super.key,required this.controller,required this.label,  this.obscureText = false });

   final bool _isEditing = false; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: _isEditing
          ? TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                labelText: label,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            )
          : Row(
              children: [
                Expanded(
                  child: Text(
                    "$label: ${controller.text}",
                    style: const TextStyle(
                        fontSize: 15,
                        color: Constant.mainColor,
                        fontWeight: FontWeight.w600,
              ),
                  ),
                ),
              ],
            ),
    );
  }
}