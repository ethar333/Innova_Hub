
import 'package:flutter/material.dart';
import 'package:innovahub_app/Auth/login/reset_password.dart';
import 'package:innovahub_app/Constants/Colors_Constant.dart';
import 'package:innovahub_app/Custom_Widgets/Text_Field_Widget.dart';

class ForgetPasswordScreen extends StatelessWidget {

  static const String routname = "forget";              // routeName of this screen:

  final email = TextEditingController();

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
               Image.asset('assets/images/forget_password_photo.jpg',
               width: double.infinity,
              fit: BoxFit.fill,
               ),
          
              const SizedBox(height: 30,),
          
              const Padding(
                padding:  EdgeInsets.only(left:10),
                child:  Text(
                  "Forgot Password!",
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
                  "Enter your email now",
                  style: TextStyle(
                    color: Constant.greyColor, 
                    fontSize: 18),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              
              TextFieldWidget(
                controller:email, label: 'Email', hint:'Enter Your Email'),
              
              const SizedBox(height: 20,),

              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {

                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => resetpassword(),));

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Constant.mainColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 13.0),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  child: const Text(
                    'Send',
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

/*Widget _buildTextFormField(
    TextEditingController controller, String label, String hint,
    {bool obscureText = false,
    bool isName = false,
    bool isEmail = false,
    bool isPassword = false}) {
  return Padding(
    padding: EdgeInsets.only(left: 10, right: 10),
    child: TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(14), // تقليل المسافة داخل الـ TextField
        labelText: label,
        labelStyle: TextStyle(color: maincolor, fontSize: 15),
        hintText: hint,
        hintStyle: TextStyle(
          color: maincolor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: maincolor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: maincolor)),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: maincolor),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        if (isName && !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {

     return 'Please enter a valid name (letters only)';
        }
        if (isEmail &&
            !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                .hasMatch(value)) {
          return 'Please enter your valid email';
        }
        if (isPassword && value.length < 8) {
          return 'password must be at least 8 chars';
        }
      },
    ),
  );
}*/






















/*import 'package:flutter/material.dart';
import 'package:sprint1/Custom_widgets/Text_field_Widget.dart';
import 'package:sprint1/constants/constant.dart';

class ForgetPassordScreen extends StatelessWidget {

  static const String routname = "forget_password";        // routeName of this screen;

  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
           const SizedBox(
              height: 80,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock,
                  size: 65,
                  color: Constant.mainColor,
                ),
              ],
            ),

           const SizedBox(height: 40, ),
           const Text(
              "Forget Password",
              style: TextStyle(
                color: Constant.mainColor, 
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            
            const SizedBox(  height: 30,),
           const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Please Enter Your Email Address",
                  style: TextStyle(color: Constant.mainColor
                  , fontSize: 18),
                ),
              ],
            ),

           const SizedBox(height: 20, ),

            TextFieldWidget(controller: email, label: 'Email', hint: 'Please Enter Your Email',
            isEmail: true, ),
          
           const SizedBox(  height: 40,),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 63, 154, 152),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 13.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                child: const Text(
                  'Send',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/





/*Widget _buildTextFormField(
    TextEditingController controller, String label, String hint,
    {bool obscureText = false,
    bool isName = false,
    bool isEmail = false,
    bool isPassword = false}) {
  return Padding(
    padding: EdgeInsets.only(left: 10, right: 10),
    child: TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(14), // تقليل المسافة داخل الـ TextField
        labelText: label,
        labelStyle: TextStyle(color: Constant.mainColor, fontSize: 15),
        hintText: hint,
        hintStyle: TextStyle(
          color: Constant.mainColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Constant.mainColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Constant.mainColor)),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Constant.mainColor),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        if (isName && !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
          return 'Please enter a valid name (letters only)';
        }
        if (isEmail &&
            !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                .hasMatch(value)) {
          return 'Please enter your valid email';
        }
        if (isPassword && value.length < 8) {
          return 'password must be at least 8 chars';
        }
      },
    ),
  );
}*/