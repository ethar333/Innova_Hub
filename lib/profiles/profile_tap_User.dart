
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:innovahub_app/Constants/Colors_Constant.dart';
import 'package:innovahub_app/Custom_Widgets/Text_Field_profile.dart';
import 'package:innovahub_app/profiles/privacy_user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileUser extends StatefulWidget {
  static String routeName = "profile_User"; // routeName of this screen:

  final String? firstnameController;
  final String? lastnameController;
  final String? emailController;
  final String? passwordController;
  final String? cityController;
  final String? phoneNumber;
  final String? district;

  const ProfileUser({
    Key? key,
    this.firstnameController,
    this.lastnameController,
    this.emailController,
    this.passwordController,
    this.cityController,
    this.phoneNumber,
    this.district,
  }) : super(key: key);

  @override
  State<ProfileUser> createState() => _ProfileDesignState();
}

class _ProfileDesignState extends State<ProfileUser> {

  File? _profileImage;
  late TextEditingController _firstnameController;
  late TextEditingController _lastnameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _cityController;
  late TextEditingController _phoneController;
  late TextEditingController _districtController;
  late TextEditingController _roleController;

  bool _isEditing = false;
  String? userid;
   bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _firstnameController = TextEditingController(text: widget.firstnameController);
    _lastnameController = TextEditingController(text: widget.lastnameController);
    _emailController = TextEditingController(text: widget.emailController);
   // _passwordController = TextEditingController(text: widget.passwordController);
    _cityController = TextEditingController(text: widget.cityController);
    _phoneController = TextEditingController(text: widget.phoneNumber);
    _districtController = TextEditingController(text: widget.district);
    _roleController = TextEditingController();

    fetchUserProfile();

  }
  Future<void> fetchUserProfile() async {
    setState(() => _isLoading = true);

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");
      userid = prefs.getString("userId");

      if (token == null) {
        throw Exception("Token is missing, please log in again.");
      }

      final response = await http.get(
        Uri.parse("https://innova-hub.premiumasp.net/api/Profile/profile"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        setState(() {
          _firstnameController.text = data['FirstName'] ?? '';
          _lastnameController.text = data['LastName'] ?? '';
          _emailController.text = data['Email'] ?? '';
          _cityController.text = data['City'] ?? '';
          _phoneController.text = data['PhoneNumber'] ?? '';
          _roleController.text = data['RoleName'] ?? '';

          _isLoading = false;

        });
      } else {
        throw Exception("Failed to load profile data");
      }
    } 
    catch (error) {
      print("Error fetching user profile: $error");
      setState(() {
        _isLoading = false;

      });
    }
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
   // _passwordController.dispose();
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
                  image: AssetImage('assets/images/background1.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundImage: _profileImage != null
                          ? FileImage(_profileImage!)
                          : null,
                      backgroundColor: Colors.grey[200],
                      child: _profileImage == null
                          ? const Icon(Icons.person,
                              size: 60, color: Colors.grey)
                          : null,
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

                      // to delete profile Image:

                     if (_profileImage != null) // يظهر فقط عند وجود صورة
                      Positioned(
                        top: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _profileImage = null; // حذف الصورة
                            });
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Constant.mainColor,
                            ),
                            padding: const EdgeInsets.all(6),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 18,
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
                padding: EdgeInsets.only(left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ahmed mohamed",
                      style: TextStyle(
                        color: Constant.whiteColor,
                        fontWeight: FontWeight.w500,
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
                        child: TextFieldProfile(
                          controller: _emailController,
                          label: 'Email',
                        ),
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
                  TextFieldProfile(controller: _phoneController, label: 'Phone Number'),
                  TextFieldProfile(controller: _districtController, label: 'District'),
                  TextFieldProfile(controller: _cityController, label: 'City'),

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
                  leading: const Icon(Icons.lock, color: Constant.mainColor),
                  title: const Text(
                    " Privacy & Security",
                    style:
                        TextStyle(fontSize: 16, color: Constant.blackColorDark),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Logic:
                    Navigator.pushNamed(context, PrivacyUser.routeName);
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
                    style:
                        TextStyle(fontSize: 16, color: Constant.blackColorDark),
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
                      SizedBox(width: 8), // إضافة مسافة بين الأيقونة والنص
                      Text(
                        "Log Out",
                        style:
                            TextStyle(fontSize: 16, color: Constant.whiteColor),
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

  
}











































