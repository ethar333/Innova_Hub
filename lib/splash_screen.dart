

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:innovahub_app/Auth/register/register_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

    static const String routeName = 'splash_screen';      // routeName of this screen:

  @override
  Widget build(BuildContext context) {
    return Scaffold(

       body: AnimatedSplashScreen(
        splashIconSize: double.infinity,
          splashTransition: SplashTransition.rotationTransition,
          animationDuration: const Duration(seconds: 5),        // Duration of Splash screen:
       
           splash:  Image.asset('assets/images/splash_screen1.jpg',

           fit: BoxFit.cover             // To fit the image:             
       
           ), 
       
            nextScreen: RegisterScreen(),

          ),

         );

    
  }

}


