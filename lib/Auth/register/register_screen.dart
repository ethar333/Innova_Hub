import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innovahub_app/Auth/Auth_Cubit/Auth_cubit.dart';
import 'package:innovahub_app/Auth/Auth_Cubit/Auth_states.dart';
import 'package:innovahub_app/Auth/login/login_screen.dart';
import 'package:innovahub_app/Constants/Colors_Constant.dart';
import 'package:innovahub_app/Custom_Widgets/Text_Field_Widget.dart';
import 'package:innovahub_app/home/home_screen.dart';


class RegisterScreen extends StatefulWidget {

  static const String routeName = 'register_screen'; // routeName of this screen:

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final districtController = TextEditingController();
  final phoneNumberController = TextEditingController();

  bool isObscurepassword = true;
  bool isObscureconfirm = true;
  String? selectedRole;
  bool isLoading = false;
  String? errorMessage;

  final _formKey = GlobalKey<FormState>(); // key of form:
   
   // Roles for Dropdown
  final List<Map<String, String>> roles = [
    {"id": "11c8c40c-169a-40cd-b6c6-b56fa4183b5a", "name": "BusinessOwner"},
    {"id": "7a5101fd-78f9-4608-a881-bfbb501c822d", "name": "Admin"},
    {"id": "ac5cc1fb-ba2e-4721-9449-3623242cc160", "name": "Investor"},
    {"id": "d27aab0b-5c65-4efe-8b29-b8c476568e15", "name": "Customer"},
  ];


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(), // to initialize AuthCubit:
      child: BlocConsumer<AuthCubit, AuthStates>(listener: (context, state) {
        if (state is RegisterSuccessState) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
        } else if (state is RegisterErrorStata) {
          // show an error message:
          final snackBar = SnackBar(
            content: Text(state.message),
            duration: const Duration(seconds: 10),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Row(
              children: [
                SizedBox(width: 10),
                Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Constant.blackColorDark,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        "Welcome To Innova App",
                        style: TextStyle(
                            color: Constant.blackColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Start Your journey now!",
                        style: TextStyle(
                          color: Constant.greyColor,
                          fontSize: 15,
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // Row for First Name and Last Name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextFieldWidget(
                            controller: firstnameController,
                            label: 'First Name',
                            hint: 'Enter Your First Name',
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: TextFieldWidget(
                            controller: lastnameController,
                            label: 'Last Name',
                            hint: 'Enter Your Last Name',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                     TextFieldWidget(
                      controller: emailController,
                      label: 'Email',
                      hint: 'Enter Your Email',
                      isEmail: true,
                    ),

                    const SizedBox(height: 15),

                    TextFieldWidget(
                      controller: passwordController,
                      label: 'Password',
                      hint: 'Enter Your Password',
                      isPassword: true,
                      obscureText: isObscurepassword,
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
                    const SizedBox(height: 15),
                
                    /* TextFieldWidget(
                    controller: confirmPasswordController,
                    label: 'Confirm Password',
                    hint: 'Confirm Your Password',
                    isPassword: true,
                  ),*/
                
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        // onChanged:isChanged,
                        controller: confirmPasswordController,
                        obscureText: isObscureconfirm,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(14), // تقليل المسافة داخل الـ TextField
                          labelText: 'Confirm password',
                          labelStyle: const TextStyle(
                              color: Color(0xFF333333), fontSize: 15),
                          hintText: 'please confirm your password',
                          hintStyle: const TextStyle(
                            color: Color(0xFF333333),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color(0xFFB2B1B1),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Constant.greyColor2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Constant.greyColor2),
                          ),
                
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isObscureconfirm =
                                    !isObscureconfirm; // تبديل حالة النص عند الضغط
                              });
                            },
                            icon: Icon(
                              isObscureconfirm
                                  ? Icons.visibility_off
                                  : Icons.visibility, // To show Icon:
                              color: isObscurepassword
                                  ? Colors.grey
                                  : Constant.blackColor,
                            ),
                          ),
                        ),
                
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ),


                    const SizedBox(height: 15),

                    // Row for Password and Confirm Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextFieldWidget(
                            controller: countryController,
                            label: 'Country',
                            hint: 'Enter Your Country',

                          ),
                        ),

                        const SizedBox(width: 15),
                        Expanded(
                          child: TextFieldWidget(
                          controller: cityController,
                          label: 'City',
                          hint: 'Enter Your City',
                       ),
                        ),
                      ],
                    ),

                     const SizedBox(height: 15),
                     
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextFieldWidget(
                           controller: districtController,
                           label: 'District',
                           hint: 'Enter Your District',

                          ),
                        ),

                        const SizedBox(width: 15),
                        Expanded(
                          child: TextFieldWidget(
                          controller: phoneNumberController,
                          label: 'Phone Number',
                          hint: 'Enter Your Phone Number',
                          isPhone: true,
                         ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 15),
                    TextFieldWidget(
                      controller: districtController,
                      label: 'District',
                      hint: 'Enter Your District',
                    ),
                    const SizedBox(height: 15),

                    // Dropdown for Role selection
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: "Select Role",
                          labelStyle: const TextStyle(
                              color: Color(0xFF333333), fontSize: 15),
                          hintText: "Choose one",
                          suffixIcon: DropdownButton<String>(
                            items: ["User", "Investor", "Owner"]
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedRole = value;
                              });
                            },
                            underline: const SizedBox(),
                            icon: const Icon(Icons.arrow_drop_down),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                                color: Constant.greyColor2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                const BorderSide(color: Constant.greyColor2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: Constant.greyColor2),
                          ),
                        ),
                        controller: TextEditingController(text: selectedRole),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a role';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (errorMessage != null)
                      Text(
                        errorMessage!,
                        style: const TextStyle(color: Colors.black),
                      ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          validateForm();
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
                          'Create Account',
                          style: TextStyle(
                              color: Constant.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: TextStyle(
                            color: Constant.blackColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: const Text(
                            "Log In",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Constant.mainColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  void validateForm() {
    if (_formKey.currentState!.validate() == true) {
      // register:
      // object from cubit to access Method:
      /*BlocProvider.of<AuthCubit>(context).register(
        firstName: firstnameController.text, // to access value from textfield:
        lastName: lastnameController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        city: cityController.text,
        country: countryController.text,
        district: districtController.text,
        phoneNumber: phoneNumberController.text,
        roleId: selectedRole!,
      );*/
    }
  }

}



  









/*class RegisterDesign extends StatefulWidget {

  static const String routeName = 'register_screen';     //routeName

  @override
  State<RegisterDesign> createState() => _RegisterDesignState();
}

class _RegisterDesignState extends State<RegisterDesign> {
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final districtController = TextEditingController();
  final phoneNumberController = TextEditingController();

  bool isObscurePassword = true;
  bool isObscureConfirm = true;
  String? selectedRoleId;

  final _formKey = GlobalKey<FormState>();

  final List<Map<String, String>> roles = [
    {"id": "11c8c40c-169a-40cd-b6c6-b56fa4183b5a", "name": "BusinessOwner"},
    {"id": "7a5101fd-78f9-4608-a881-bfbb501c822d", "name": "Admin"},
    {"id": "ac5cc1fb-ba2e-4721-9449-3623242cc160", "name": "Investor"},
    {"id": "d27aab0b-5c65-4efe-8b29-b8c476568e15", "name": "Customer"},
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text("Registration successful!", style: TextStyle(color: Colors.green)),
            ),
          );
          Navigator.pushReplacementNamed(context,HomeScreen.routeName);
        }
        if (state is RegisterErrorStata) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(state.message, style: TextStyle(color: Colors.black)),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Sign Up'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: firstnameController,
                      decoration: InputDecoration(labelText: 'First Name'),
                      validator: (value) => value!.isEmpty ? 'Please enter your first name' : null,
                    ),
                    TextFormField(
                      controller: lastnameController,
                      decoration: InputDecoration(labelText: 'Last Name'),
                      validator: (value) => value!.isEmpty ? 'Please enter your last name' : null,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) => value!.isEmpty ? 'Please enter your email' : null,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: isObscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(isObscurePassword ? Icons.visibility_off : Icons.visibility),
                          onPressed: () => setState(() => isObscurePassword = !isObscurePassword),
                        ),
                      ),
                      validator: (value) => value!.isEmpty ? 'Please enter a password' : null,
                    ),
                    TextFormField(
                      controller: confirmPasswordController,
                      obscureText: isObscureConfirm,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        suffixIcon: IconButton(
                          icon: Icon(isObscureConfirm ? Icons.visibility_off : Icons.visibility),
                          onPressed: () => setState(() => isObscureConfirm = !isObscureConfirm),
                        ),
                      ),
                      validator: (value) {
                        if (value != passwordController.text) return 'Passwords do not match';
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: phoneNumberController,
                      decoration: InputDecoration(labelText: 'Phone Number'),
                      validator: (value) => value!.isEmpty ? 'Please enter your phone number' : null,
                    ),
                    TextFormField(
                      controller: countryController,
                      decoration: InputDecoration(labelText: 'Country'),
                      validator: (value) => value!.isEmpty ? 'Please enter your country' : null,
                    ),
                    TextFormField(
                      controller: cityController,
                      decoration: InputDecoration(labelText: 'City'),
                      validator: (value) => value!.isEmpty ? 'Please enter your city' : null,
                    ),
                    TextFormField(
                      controller: districtController,
                      decoration: InputDecoration(labelText: 'District'),
                      validator: (value) => value!.isEmpty ? 'Please enter your district' : null,
                    ),
                    DropdownButtonFormField<String>(
                      value: selectedRoleId,
                      decoration: InputDecoration(labelText: "Select Role"),
                      items: roles.map((role) {
                        return DropdownMenuItem<String>(
                          value: role['id'],
                          child: Text(role['name']!),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedRoleId = value;
                        });
                      },
                      validator: (value) => value == null ? 'Please select a role' : null,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthCubit>().register(
                            firstName: firstnameController.text,
                            lastName: lastnameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            confirmPassword: confirmPasswordController.text,
                            city: cityController.text,
                            country: countryController.text,
                            district: districtController.text,
                            phoneNumber: phoneNumberController.text,
                            roleId: selectedRoleId!,
                          );
                        }
                      },
                      child: Text(state is RegisterLoadingState ? 'Loading...' : 'Create Account'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}*/









