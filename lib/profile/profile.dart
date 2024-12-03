
import 'dart:io'; 
import 'package:flutter/material.dart'; 
import 'package:image_picker/image_picker.dart';
import 'package:innovahub_app/Constants/Colors_Constant.dart';
 
class ProfileScreen extends StatefulWidget { 

  static String routeName = "profile_screen"; 

  final String firstnameController; 
  final String lastnameController; 
  final String emailController; 
  final String passwordController; 
  final String cityController; 
  final String phoneNumber; 
 
  const ProfileScreen({ 
    Key? key, 
    required this.firstnameController, 
    required this.lastnameController, 
    required this.emailController, 
    required this.passwordController, 
    required this.cityController, 
    required this.phoneNumber, 
  }) : super(key: key); 
 
  @override 
  State<ProfileScreen> createState() => _ProfileDesignState(); 
} 
 
class _ProfileDesignState extends State<ProfileScreen> { 
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
    _firstnameController = 
        TextEditingController(text: widget.firstnameController); 
    _lastnameController = 
        TextEditingController(text: widget.lastnameController); 
    _emailController = TextEditingController(text: widget.emailController); 
    _passwordController = 
        TextEditingController(text: widget.passwordController); 
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
        padding: EdgeInsets.all(16.0), 
        child: Column( 
          children: [ 
            Text( 
              "Profile", 
              style: TextStyle( 
                color: Constant.mainColor, 
                fontSize: 24, 
                fontWeight: FontWeight.bold, 
              ), 
            ), 
            const SizedBox(height: 20), 
            Center( 
              child: Stack( 
                children: [ 
                  CircleAvatar( 
                    radius: 60, 
                    backgroundImage: _profileImage != null 
                        ? FileImage(_profileImage!) 
                        : null, 
                    child: _profileImage == null 
                        ? const Icon(Icons.person, size: 60, color: Colors.grey) 
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
                          color: Constant.mainColor, 
                        ), 
                        padding: const EdgeInsets.all(8), 
                        child: const Icon( 
                          Icons.camera_alt, 
                          color: Colors.white, 
                        ), 
                      ), 
                    ), 
                  ), 
                ], 
              ), 
            ), 
            const SizedBox(height: 20),
            _buildProfileField("First Name", _firstnameController), 
            _buildProfileField("Last Name", _lastnameController), 
            _buildProfileField("Email", _emailController), 
            _buildProfileField("Password", _passwordController, 
                obscureText: true), 
            _buildProfileField("City", _cityController), 
            _buildProfileField("Phone Number", _phoneController), 
            const SizedBox(height: 30), 
            /* 
             ElevatedButton( 
              style: ElevatedButton.styleFrom( 
                backgroundColor: textcolor, 
                shape: RoundedRectangleBorder( 
                  borderRadius: BorderRadius.circular(12), 
                ), 
                padding: 
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32), 
              ), 
              onPressed: () { 
                ScaffoldMessenger.of(context).showSnackBar( 
                  const SnackBar( 
                      content: Text('Profile updated successfully!')), 
                ); 
 
                // Perform save logic here 
                print("First Name: ${_firstnameController.text}"); 
                print("Last Name: ${_lastnameController.text}"); 
                print("Email: ${_emailController.text}"); 
                print("City: ${_cityController.text}"); 
                print("Phone: ${_phoneController.text}"); 
              }, 
              child: Text( 
                "Save Changes", 
                style: TextStyle(fontSize: 16, color: Colors.white), 
              ), 
            ),*/ 
          ], 
        ), 
      ), 
      floatingActionButton: FloatingActionButton( 
        onPressed: () { 
          setState(() { 
            _isEditing = !_isEditing; 
          }); 
        }, 
        child: Icon( 
          _isEditing ? Icons.check : Icons.edit, 
          color: Constant.mainColor, 
        ), 
      ), 
    ); 
  } 
 
  Widget _buildProfileField(String label, TextEditingController controller, 
      {bool obscureText = false}) { 
    return Padding( 
      padding: const EdgeInsets.symmetric(vertical: 8.0), 
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
                        fontSize: 16, 
                        color: Constant.mainColor, 
                        fontWeight: FontWeight.bold), 
                  ), 
                ), 
              ], 
            ), 
    ); 

  } 
  
}











































/*import 'dart:io'; 
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sprint1/Custom_widgets/Text_Field_Profile.dart';
import 'package:sprint1/constants/constant.dart'; 


class ProfileScreen extends StatefulWidget { 

  static const String routeName = "profile_screen";      // route of this screen:

  final String firstnameController ;
  final String lastnameController ;
  final String emailController ;
  final String passwordController ;
  final String cityController ;
  final String phoneNumber ;

   ProfileScreen({ 
    Key? key, 
     this.firstnameController = '', 
     this.lastnameController ='',
     this.emailController = '', 
     this.passwordController = '', 
     this.cityController = '', 
     this.phoneNumber = '', 
  }) : super(key: key); 

  @override 
  State<ProfileScreen> createState() => _ProfileDesignState(); 
} 
 
class _ProfileDesignState extends State<ProfileScreen> { 
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
    _firstnameController = TextEditingController(text: widget.firstnameController); 
    _lastnameController = TextEditingController(text: widget.lastnameController); 
    _emailController = TextEditingController(text: widget.emailController); 
    _passwordController =  TextEditingController(text: widget.passwordController); 
    _cityController = TextEditingController(text: widget.cityController); 
    _phoneController = TextEditingController(text: widget.phoneNumber); 
  } 
 
  Future<void> _pickImage() async { 
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery); 
    if (pickedFile != null) { 
      setState(() { 
        _profileImage = File(pickedFile.path); 
      }); 
    } 
    else {

      print('Image Picker is already active');
    // Here you can close the Image Picker or perform any other necessary action
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
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 35), 
        child: Column( 
          children: [ 
            const Text( 
              "Profile", 
              style: TextStyle( 
                color: Constant.blackColorDark, 
                fontSize: 24, 
                fontWeight: FontWeight.bold, 
              ), 
            ), 
            const SizedBox(height: 20), 
            Center( 
              child: Stack( 
                children: [ 
                  CircleAvatar( 
                    radius: 60, 
                    backgroundImage: _profileImage != null 
                        ? FileImage(_profileImage!) 
                        : null, 
                    child: _profileImage == null 
                        ? const Icon(Icons.person, size: 60, color: Colors.grey) 
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
                          color: Constant.mainColor, 
                        ), 
                        padding: const EdgeInsets.all(8), 
                        child: const Icon( 
                          Icons.camera_alt, 
                          color: Colors.white, 
                        ), 
                      ), 
                    ), 
                  ), 
                ], 
              ), 
            ), 

            const SizedBox(height: 20),
            TextFieldProfile(controller: _firstnameController, label: 'First Name'),
            TextFieldProfile(controller: _lastnameController, label: 'Last Name'),
            TextFieldProfile(controller: _emailController, label: 'Email'),
            TextFieldProfile(controller: _passwordController, label: 'Password',obscureText:true),
            TextFieldProfile(controller: _cityController, label: 'City'),
            TextFieldProfile(controller: _phoneController, label: 'Phone_Number'),



          /*  _buildProfileField("First Name", _firstnameController), 
            _buildProfileField("Last Name", _lastnameController), 
            _buildProfileField("Email", _emailController), 
            _buildProfileField("Password", _passwordController, obscureText: true), 
            _buildProfileField("City", _cityController), 
            _buildProfileField("Phone Number", _phoneController), */
            const SizedBox(height: 30), 

           
          ], 
        ), 
      ), 

      floatingActionButton: FloatingActionButton( 
        onPressed: () { 
          setState(() { 
            _isEditing = !_isEditing;

          }); 
        }, 
        child: Icon( 
          _isEditing ? Icons.check : Icons.edit, 
          color: Constant.mainColor, 
        ), 
      ), 
    ); 
  } 
 
 
}*/
