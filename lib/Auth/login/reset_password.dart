

import 'package:flutter/material.dart';
import 'package:innovahub_app/Constants/Colors_Constant.dart';
import 'package:innovahub_app/Custom_Widgets/Text_Field_Widget.dart';


class resetpassword extends StatefulWidget {

  static const String routname = "reset_password";                
  @override
  State<resetpassword> createState() => _resetpasswordState();              // routeName of this screen:

}

class _resetpasswordState extends State<resetpassword> {

  final password = TextEditingController();
  bool isObscurepassword = true;
  bool isObscureconfirm = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        //centerTitle: true,
        title: const Text(
          'Login',
          style: TextStyle(
              color: Constant.blackColorDark,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(

        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              const SizedBox( height: 30,),
               Image.asset('assets/images/reset_password_photo.jpg',
               width: double.infinity,
              fit: BoxFit.fill,
               ),
          
              const SizedBox(height: 30,),
          
              const Padding(
                padding:  EdgeInsets.only(left:10),
                child:  Text(
                  "Reset Password now",
                  style: TextStyle(
                      color: Constant.blackColor,
                       fontSize: 24, 
                       fontWeight: FontWeight.bold),
                ),
              ),
              
              const SizedBox(
                height: 10,
              ),
              
              const Padding(
                padding:  EdgeInsets.only(left: 10),
                child:  Text(
                  "Enter your new password",
                  style: TextStyle(
                    color: Constant.greyColor, 
                    fontSize: 18),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              
              TextFieldWidget(
                controller: password, label: 'password', hint:'Enter Your Password',
                isPassword: true,obscureText: isObscurepassword,
                   suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObscurepassword = !isObscurepassword;        // تبديل حالة النص عند الضغط
                          });
                        },

                        icon: Icon(
                          isObscurepassword ? Icons.visibility_off
                              : Icons.visibility,          // To show Icon:
                          color: isObscurepassword
                              ? Colors.grey
                              : Constant.blackColor,
                        ),
                      ),
                ),
              
              const SizedBox(height: 10,),

               const Padding(
                padding:  EdgeInsets.only(left: 10),
                child:  Text(
                  "Confirm new password",
                  style: TextStyle(
                    color: Constant.greyColor, 
                    fontSize: 18),
                ),
              ),

              const SizedBox(height: 10,),

              TextFieldWidget(
                controller: password, label: 'Confirm password', hint:'Confirm Your Password',
                isPassword: true,obscureText: isObscurepassword,
                suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObscurepassword = !isObscurepassword;        // تبديل حالة النص عند الضغط
                          });
                        },

                        icon: Icon(
                          isObscurepassword ? Icons.visibility_off
                              : Icons.visibility,          // To show Icon:
                          color: isObscurepassword
                              ? Colors.grey
                              : Constant.blackColor,
                        ),
                      ),
                ),
                
              const SizedBox(height: 20,),

              
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Constant.mainColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 13.0),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  child: const Text(
                    'Reset',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Constant.whiteColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
          
              
            ],
          ),
        ),
      ),
    );


  }
}
