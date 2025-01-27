
import 'package:flutter/material.dart';
import 'package:innovahub_app/Constants/Colors_Constant.dart';

class ContainerOwner extends StatelessWidget {
   ContainerOwner({super.key,required this.icon, required this.label,required this.num});

  IconData icon ;
  String label;
  String num;
  
  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(15),
              decoration:  BoxDecoration(
                color: Constant.mainColor,
                borderRadius: BorderRadius.circular(12),
             ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   CircleAvatar(
                    backgroundColor: Constant.mainColor,
                    radius: 20,
                    child: Icon(icon,color: Constant.whiteColor,size: 30,)),     // Icon:

                    Text(label,                  // text:
                   style: const TextStyle( 
                    color: Constant.whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                   ),
                   ),

                    // container:
                   Container(                            
                    //margin: EdgeInsets.only(left: 30),
                    //padding: const EdgeInsets.only(left: 10, right: 10),
                    width: 90,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Constant.whiteColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child:  Center(
                      child: Text(num,
                      style: const TextStyle(
                       color: Constant.blackColorDark,
                       fontSize: 15,
                       fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                   ),




                ],
              ),
             );


  }
}