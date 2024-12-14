

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:innovahub_app/Auth/Auth_Cubit/Auth_cubit.dart';
import 'package:innovahub_app/Auth/Auth_Cubit/Auth_states.dart';
import 'package:innovahub_app/Auth/login/forget_password.dart';
import 'package:innovahub_app/Auth/login/reset_password.dart';
import 'package:innovahub_app/Auth/register/register_screen.dart';
import 'package:innovahub_app/Constants/Colors_Constant.dart';
import 'package:innovahub_app/Custom_Widgets/Text_Field_Widget.dart';
import 'package:innovahub_app/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routname = 'login_screen'; // routeName of login screen:

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final email = TextEditingController();
  final passsword = TextEditingController();     // old password:
   
  bool isObscurepassword = true;

  final _formKey = GlobalKey<FormState>(); // key of form Widget:
  
  String? resetPassword;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Retrieve the password passed as an argument
    // TextEditingController? resetPassword = ModalRoute.of(context)?.settings.arguments as TextEditingController?;

    final String? resetPasswordArg = ModalRoute.of(context)?.settings.arguments as String?;

    // If the password is not null, set it in the controller
    if (resetPasswordArg != null) {
      resetPassword = resetPasswordArg; // Set the resetPassword value
      passsword.text = resetPasswordArg; // Assign the password value to the TextEditingController
    }
  }


  void _showDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          message,
          style: const TextStyle(
            color: Color.fromARGB(255, 112, 182, 182),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              },
              child: const Text(
                "OK",
                style: TextStyle(
                  color: Color.fromARGB(255, 112, 182, 182),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    

    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          _showDialog(context, "Login successful!");

          if ( resetPassword != null) {
            // If reset password was used, navigate to home screen
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          }

          // Navigator.pushReplacementNamed(context, HomeScreen.routeName);

           /*Future.delayed(const Duration(seconds: 2), () {

            // Adjust the duration as needed:
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);

          });*/

        } else if (state is LoginErrorState) {
          _showDialog(context, state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            //centerTitle: true,
            title: const Text(
              'Log in',
              style: TextStyle(
                  color: Constant.blackColorDark,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          "Welcome Back",
                          style: TextStyle(
                              color: Constant.blackColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Sign in to your account",
                          style: TextStyle(
                            color: Constant.greyColor,
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFieldWidget(
                          controller: email,
                          label: 'Email Address',
                          hint: 'Enter Your Email',
                          isEmail: true),
                      const SizedBox(
                        height: 20,
                      ),
                  
                      TextFieldWidget(
                      
                        controller: passsword,
                        label: 'Password',
                        hint: 'Enter Your Password',
                        isPassword: true,
                        obscureText: isObscurepassword,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObscurepassword =!isObscurepassword; // تبديل حالة النص عند الضغط
                            });
                          },
                          icon: Icon(
                            isObscurepassword
                                ? Icons.visibility_off
                                : Icons.visibility, // To show Icon:
                            color: isObscurepassword
                                ? Colors.grey
                                : Constant.blackColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            child: InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgetPasswordScreen())); // Navigation:
                              },
                              child: const Text(
                                "Forget Password",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 112, 182, 182),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                  
                            // validateForm();
                            if (_formKey.currentState!.validate()) {
                  
                              // Trigger login only if the form is valid
                              BlocProvider.of<AuthCubit>(context).login(
                                  email: email.text, password: passsword.text);
                  
                  
                              /*  if(resetpassword != null ){
                                   BlocProvider.of<AuthCubit>(context).login(
                                  email: email.text, password: resetpassword.text);
                  
                                }*/
                              
                            }
                  
                            
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Constant.mainColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 13.0),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {},
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Constant.whiteColor,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don’t have an account?",
                            style: TextStyle(
                              color: Constant.blackColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Color.fromARGB(255, 112, 182, 182),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Center(
                        child: Text(
                          'Or Sign In With',
                          style: TextStyle(
                            color: Constant.greyColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                  
                            icon: const FaIcon(
                                FontAwesomeIcons.google), // add Google Icon:
                            iconSize: 30,
                            color: Constant.mainColor,
                            // color: Colors.teal,
                          ),
                  
                          const Text(
                            'Google',
                            style: TextStyle(
                              color: Constant.blackColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                  
                          //const SizedBox(width:40 ,),
                  
                          /* IconButton(
                          onPressed: () {
                            
                          },
                          
                          icon: const Icon(Icons.facebook),
                          iconSize: 35,
                         color: Constant.mainColor,
                         // color: Colors.teal,
                        ),
                                  
                       const Text('Facebook',
                       style: TextStyle(
                        color: Constant.blackColor,
                        fontWeight: FontWeight.w400,
                       ),
                       
                       ),*/
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}




      /*child: Scaffold(
        appBar: AppBar(
          //centerTitle: true,
          title: const Text(
            'Log in',
            style: TextStyle(
                color: Constant.blackColorDark,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      "Welcome Back",
                      style: TextStyle(
                          color: Constant.blackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Sign in to your account",
                      style: TextStyle(
                        color: Constant.greyColor,
                        fontSize: 15,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
      
                  const SizedBox(height: 40,),
                  TextFieldWidget(
                      controller: email,
                      label: 'Email Address',
                      hint: 'Enter Your Email',
                      isEmail: true),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    controller: passsword, label: 'Password',
                    hint: 'Enter Your Password',
                    isPassword: true, obscureText: true,
                    // suffixIcon: ,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ForgetPasswordScreen())); // Navigation:
                          },
                          child: const Text(
                            "Forget Password",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 112, 182, 182),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Container(
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
                      child: InkWell(
                        onTap: () {},
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Constant.whiteColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don’t have an account?",
                        style: TextStyle(
                          color: Constant.blackColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> RegisterScreen()));
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color.fromARGB(255, 112, 182, 182),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Center(
                    child: Text(
                      'Or Sign In With',
                      style: TextStyle(
                        color: Constant.greyColor,
                      ),
                    ),
                  ),
      
                  const SizedBox( height:8 ,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
              
                        icon: const FaIcon(
                            FontAwesomeIcons.google), // add Google Icon:
                        iconSize: 30,
                        color: Constant.mainColor,
                        // color: Colors.teal,
                      ),
              
                      const Text(
                        'Google',
                        style: TextStyle(
                          color: Constant.blackColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
              
                      //const SizedBox(width:40 ,),
              
                      /* IconButton(
                        onPressed: () {
                          
                        },
                        
                        icon: const Icon(Icons.facebook),
                        iconSize: 35,
                       color: Constant.mainColor,
                       // color: Colors.teal,
                      ),
                                
                     const Text('Facebook',
                     style: TextStyle(
                      color: Constant.blackColor,
                      fontWeight: FontWeight.w400,
                     ),
                     
                     ),*/
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateForm() {
    if (_formKey.currentState!.validate()) {
      // logoin:
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    }
  }
}*/







/*class Logindesign extends StatefulWidget { 

  static const String routname = "log";        // routeName:
 
  @override 
  State<Logindesign> createState() => _MyWidgetState(); 
} 
 
class _MyWidgetState extends State<Logindesign> { 
  final TextEditingController _emailController = TextEditingController(); 
 
  final TextEditingController _passwordController = TextEditingController(); 
 
  String? _errorMessage; 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title: Text('Login')), 
      body: Padding( 
        padding: const EdgeInsets.all(16.0), 
        child: Column( 
          children: [ 
            TextField( 
              controller: _emailController, 
              decoration: InputDecoration(labelText: 'Email'), 
            ), 
            TextField( 
              controller: _passwordController, 
              decoration: InputDecoration(labelText: 'Password'), 
              obscureText: true, 
            ), 
            SizedBox(height: 20), 
            ElevatedButton( 
              onPressed: _login, 
              child: Text('Login'), 
            ),

            BlocListener<AuthCubit, AuthStates>( 
              listener: (context, state) { 

                if (state is LoginSuccessState) {                     // انتقل إلى الشاشة الرئيسية 
                  Navigator.pushReplacementNamed(context, HomeScreen.routeName); 
                } 

                else if (state is LoginErrorState ) { 

                  setState(() { 
                    _errorMessage = state.message; 
                  }); 
                } 
              }, 
              child: Container(), 
            ), 
            if (_errorMessage != null) 
              Text(_errorMessage!, style: TextStyle(color: Colors.red)), 
          ], 
        ), 
      ), 
    ); 
  } 
 
  void _login() { 
    final email = _emailController.text; 
    final password = _passwordController.text; 
 
    // استدعاء دالة تسجيل الدخول من AuthCubit 
    context.read<AuthCubit>().login(email: email, password: password); 
  } 
}*/


