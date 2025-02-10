
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:innovahub_app/Constants/Colors_Constant.dart';
import 'package:innovahub_app/profiles/privacy_owner_investor.dart';


class ProfileInvestor extends StatefulWidget { 

  static String routeName = "profile_owner";            // routeName of this screen:

  final String? firstnameController; 
  final String? lastnameController; 
  final String? emailController; 
  final String? passwordController; 
  final String? cityController; 
  final String? phoneNumber; 
  
  const ProfileInvestor({ 
    Key? key, 
     this.firstnameController, 
     this.lastnameController, 
     this.emailController, 
     this.passwordController, 
     this.cityController, 
     this.phoneNumber, 
  }) : super(key: key); 
 
  @override 
  State<ProfileInvestor> createState() => _ProfileDesignState(); 
} 
 
class _ProfileDesignState extends State<ProfileInvestor> { 
  File? _profileImage; 
 
  late TextEditingController _firstnameController; 
  late TextEditingController _lastnameController; 
  late TextEditingController _emailController; 
  late TextEditingController _passwordController; 
  late TextEditingController _cityController; 
  late TextEditingController _phoneController; 
 
  bool _isEditing = false; 
 
  @override 
  void initState() { 
    super.initState(); 
    
    _firstnameController =  TextEditingController(text: widget.firstnameController); 
    _lastnameController =  TextEditingController(text: widget.lastnameController); 
    _emailController = TextEditingController(text: widget.emailController); 
    _passwordController =  TextEditingController(text: widget.passwordController); 
    _cityController = TextEditingController(text: widget.cityController); 
    _phoneController = TextEditingController(text: widget.phoneNumber); 
  } 
 

  Future<void> _pickImage() async { 
    final pickedFile = 
        await ImagePicker().pickImage(source: ImageSource.gallery); 
     if (pickedFile != null) { 
      setState(() { 
        _profileImage = File(pickedFile.path); 
      }); 
    } 
  } 
 
  @override 
  void dispose() { 
    _firstnameController.dispose(); 
    _lastnameController.dispose(); 
    _emailController.dispose(); 
    _passwordController.dispose(); 
    _cityController.dispose(); 
    _phoneController.dispose(); 
    super.dispose(); 
  } 
 
  @override 
  Widget build(BuildContext context) { 

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),
            // Profile Header
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:AssetImage('assets/images/background1.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Stack(
                  children: [
                    const Positioned(
                      //bottom: 10,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage('assets/images/owner1.png'),
                        backgroundColor: Colors.transparent,
                      ),
                     ),

                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(4),
                          child: const Icon(
                            Icons.edit,
                            color: Constant.mainColor,
                            size: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // User Info Section
            Container(
              width: double.infinity,
              height: 70,
              decoration: const BoxDecoration(
                color: Constant.mainColor,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(100)),
              ),
              child: const Padding(
                padding:  EdgeInsets.only(left: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Text(
                          "Ahmed mohamed",
                          style: TextStyle(
                              color: Constant.whiteColor,
                              fontWeight:FontWeight.w500,
                              fontSize: 16,
                        ),
                        ),
                        Text(
                          "ID:123465678",
                          style: TextStyle(
                              color: Constant.whiteColor,
                              fontWeight: FontWeight.w200,
                              fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    
                    //SizedBox(width: 50,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Row(
                         children: [
                           Text(
                              "Role:",
                              style: TextStyle(
                                  color: Constant.whiteColor,
                                  fontWeight:FontWeight.w500,
                                  fontSize: 16,
                            ),
                            textAlign: TextAlign.end,
                            ),

                            Text(
                            " Investor",
                           style: TextStyle(
                              color: Constant.whiteColor,
                              fontWeight:FontWeight.w200,
                              fontSize: 16,
                        ),
                       ),
                         ],
                       ),
                        
                       Row(
                        children: [
                    
                          CircleAvatar(
                            radius: 7,
                            backgroundColor: Constant.whiteColor,
                            child: Icon(
                              Icons.check,
                              color: Constant.blue3Color,
                              size: 12,
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Verified',
                            style: TextStyle(
                              color: Constant.whiteColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w200
                            ),
                          ),
                        ],
                       )
                      ],
                    ),

                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 15),

            // Profile Fields Section
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                     Flexible(
                        fit: FlexFit.loose,
                        child: _buildProfileField("Email", _emailController),
                      ),

                      IconButton(
                        onPressed: () {
                          setState(() {
                            _isEditing = !_isEditing;
                          });
                        },
                        icon: Icon(
                          _isEditing ? Icons.check : Icons.edit,
                          color: Constant.mainColor,
                        ),
                        iconSize: 25,
                      ),
                    ],
                  ),

                  _buildProfileField("Phone Number", _phoneController),
                  _buildProfileField("District", _phoneController),
                  _buildProfileField("City", _cityController),
                 
                 const SizedBox(height: 6),

                  const Divider(
                    indent: 20,
                    endIndent: 20,
                    color: Constant.greyColor2,
                   // thickness: 1,
                  ),

                ],
              ),
            ),

            const SizedBox(height: 15),

             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Constant.mainColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),

                child: ListTile(
                  leading: const Icon(Icons.show_chart, color: Constant.mainColor),
                  title: const Text(
                    "Discover your Dashboard",
                    style: TextStyle(fontSize: 16,color: Constant.blackColorDark),
                  ),

                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Log out logic
                  },

                ),
              ),
            ),

              const SizedBox(
              height: 15,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Constant.mainColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),

                child: ListTile(
                  leading: const Icon(Icons.lock, color: Constant.mainColor),
                  title: const Text(
                    " Privacy & Security",
                    style: TextStyle(fontSize: 16,color: Constant.blackColorDark),
                  ),

                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Log out logic
                    Navigator.pushNamed(context, PrivacyOwnerInvestor.routeName);
                  },

                ),
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Constant.mainColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: const Icon(Icons.payment, color: Constant.mainColor),
                  title: const Text(
                    "Payment Methods",
                    style: TextStyle(fontSize: 16,color: Constant.blackColorDark),
                  ),
                  
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Log out logic
                  },

                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // Logout Button:

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                //color: Constant.mainColor,
                decoration: BoxDecoration(
                  color: Constant.mainColor,
                  border: Border.all(
                    color: Constant.greyColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: const Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // جعل العناصر في المنتصف
                    children: [
                      Icon(Icons.login_outlined, color: Constant.whiteColor),
                       SizedBox(
                          width: 8), // إضافة مسافة بين الأيقونة والنص
                       Text(
                        "Log Out",
                        style: TextStyle(fontSize: 16,color: Constant.whiteColor),
                      ),
                    ],

                  ),

                  //trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            
                  onTap: () {
                    // Log out logic
                  },
            
                ),
              ),

            ),
            
          ],

        ),
      ),
    );
  }

  Widget _buildProfileField(String label, TextEditingController controller,
      {bool obscureText = false}) {
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








