

import 'package:flutter/material.dart';
import 'package:innovahub_app/Api/Api_Manager_deals.dart';
import 'package:innovahub_app/Models/Deals/Business_owner_response.dart';
import 'package:innovahub_app/home/widget/custom_search_bar.dart';
import 'package:innovahub_app/home/widget/title_and_description.dart';

class TrainingPage extends StatelessWidget {
  //final CategoryModel categoryModel;

  const TrainingPage({ super.key,});

  static const String routeName = 'page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Innova'),
      ),

      body: 
          // display Deals:
          
      FutureBuilder<List<BusinessOwnerResponse>>(
        future: ApiManagerDeals.getAllDeals(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No businesses found"));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {

                BusinessOwnerResponse business = snapshot.data![index];
                
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    /*leading: Image.network(business.images.isNotEmpty
                        ? business.images[0]
                        : "assets/images/photo1.png"),*/
                    title: Text(business.businessName),
                    subtitle: Text(business.description),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}





















/*class ProfileCustomer extends StatefulWidget {
  static const  String routeName = "profile_User";

  const ProfileCustomer({Key? key}) : super(key: key);

  @override
  State<ProfileCustomer> createState() => _ProfileDesignState();
}

class _ProfileDesignState extends State<ProfileCustomer> {
  late TextEditingController _firstnameController;
  late TextEditingController _lastnameController;
  late TextEditingController _emailController;
  late TextEditingController _cityController;
  late TextEditingController _phoneController;
  late TextEditingController _districtController;
  late TextEditingController _roleController;

  bool _isEditing = false;
  String? userid;
  File? _profileImage;
  String? _uploadedImageUrl;
  bool _isLoading = true;
  UserProfile? _userProfile;

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  Future<void> _fetchUserProfile() async {
    
    UserProfile? userProfile = await ApiManagerProfiles.fetchUserProfile();
    
    if (userProfile != null) {
      setState(() {
        _userProfile = userProfile;
        _firstnameController = TextEditingController(text: userProfile.firstName);
        _lastnameController = TextEditingController(text: userProfile.lastName);
        _emailController = TextEditingController(text: userProfile.email);
        _cityController = TextEditingController(text: userProfile.city);
        _phoneController = TextEditingController(text: userProfile.phoneNumber);
        _districtController = TextEditingController(text: userProfile.district);
        _roleController = TextEditingController(text: userProfile.roleName);
        _uploadedImageUrl = userProfile.profileImageUrl;
        userid = userProfile.roleId;
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
    _cityController.dispose();
    _phoneController.dispose();
    _districtController.dispose();
    _roleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 25),
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
                            radius: 60,
                            backgroundImage: _uploadedImageUrl != null
                                ? NetworkImage(_uploadedImageUrl!)
                                : (_profileImage != null
                                    ? FileImage(_profileImage!)
                                    : null) as ImageProvider?,
                            backgroundColor: Colors.grey[200],
                            child: _uploadedImageUrl == null && _profileImage == null
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
                  Container(
                    width: double.infinity,
                    height: 70,
                    decoration: const BoxDecoration(
                      color: Constant.mainColor,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(100)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${_firstnameController.text} ${_lastnameController.text}",
                            style: const TextStyle(
                              color: Constant.whiteColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "User ID: ${userid ?? 'Loading...'}",
                            style: const TextStyle(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        /*TextFieldProfile(controller: _emailController, label: 'Email'),
                        TextFieldProfile(controller: _phoneController, label: 'Phone Number'),
                        TextFieldProfile(controller: _districtController, label: 'District'),
                        TextFieldProfile(controller: _cityController, label: 'City'),*/
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}*/




