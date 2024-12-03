
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innovahub_app/Auth/Auth_Cubit/Auth_cubit.dart';
import 'package:innovahub_app/Auth/login/forget_password.dart';
import 'package:innovahub_app/Auth/login/login_screen.dart';
import 'package:innovahub_app/Auth/login/reset_password.dart';
import 'package:innovahub_app/Auth/register/register_screen.dart';
import 'package:innovahub_app/home/home_screen.dart';
import 'package:innovahub_app/profile/profile.dart';
import 'package:innovahub_app/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[

      BlocProvider(create: (context)=> AuthCubit()),


      ] ,
      
       child: MaterialApp(
       debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName :(context) =>  const SplashScreen(),
        RegisterScreen.routeName : (context) =>  RegisterScreen(),
        //RegisterDesign.routeName:(context)=>RegisterDesign(),
       // Logindesign.routname:(context) => Logindesign(),
        LoginScreen.routname : (context) => LoginScreen(),
        ForgetPasswordScreen.routname : (contect) => ForgetPasswordScreen(),
        resetpassword.routname : (context) => resetpassword(),
        HomeScreen.routeName :(context) => const HomeScreen(),
        ProfileScreen.routeName : (context) =>  const ProfileScreen(
        firstnameController: '', lastnameController: '', emailController:'', passwordController: '', cityController: '', phoneNumber: ''),
      },
     
     initialRoute: RegisterScreen.routeName,

       ),

       
       );
    

  }
}

