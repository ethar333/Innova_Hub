
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innovahub_app/Auth/Auth_Cubit/Auth_cubit.dart';
import 'package:innovahub_app/Auth/login/forget_password.dart';
import 'package:innovahub_app/Auth/login/login_screen.dart';
import 'package:innovahub_app/Auth/login/reset_password.dart';
import 'package:innovahub_app/Auth/register/register_screen.dart';
import 'package:innovahub_app/core/network/dio_helper.dart';
import 'package:innovahub_app/core/services/cache_services.dart';
import 'package:innovahub_app/home/Deals/adding_deal_owner.dart';
import 'package:innovahub_app/home/home_Tap_Categories.dart';
import 'package:innovahub_app/home/home_Tap_Investor.dart';
import 'package:innovahub_app/home/home_Tap_owner.dart';
import 'package:innovahub_app/home/home_screen.dart';
import 'package:innovahub_app/home/register_page.dart';
import 'package:innovahub_app/profiles/privacy_owner_investor.dart';
import 'package:innovahub_app/profiles/privacy_user.dart';
import 'package:innovahub_app/profiles/profile_tap_Investor.dart';
import 'package:innovahub_app/profiles/profile_tap_User.dart';
import 'package:innovahub_app/splash_screen.dart';


void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  
  await CacheService.init();
  await DioHelper.init();
  
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[

      BlocProvider<AuthCubit>(create: (context)=> AuthCubit()),
      ] ,
      
       child: MaterialApp(
       debugShowCheckedModeBanner: false,
      routes: {
        TrainingPage.routeName : (context) => const TrainingPage(),
        SplashScreen.routeName :(context) =>  const SplashScreen(),
        RegisterScreen.routeName : (context) =>  RegisterScreen(),
        //RegisterDesign.routeName:(context)=>RegisterDesign(),
       // Logindesign.routname:(context) => Logindesign(),
        LoginScreen.routname : (context) => LoginScreen(),
        ForgetPasswordScreen.routname : (contect) => ForgetPasswordScreen(),
        resetpassword.routname : (context) => resetpassword(),
        HomeScreen.routeName :(context) => const HomeScreen(),
        HomeScreenOwner.routeName :(context) => const HomeScreenOwner(),
       // AddingDealOwner.routeName : (context) => AddingDealOwner(),
        HomeScreenInvestor.routeName : (context) => const HomeScreenInvestor(),
        HomeScreenCategories.routeName : (context) => const HomeScreenCategories(),
        ProfileInvestor.routeName : (context) => const ProfileInvestor(),
        ProfileUser.routeName : (context) => const ProfileUser(),
        PrivacyUser.routeName : (context) => const PrivacyUser(),
        PrivacyOwnerInvestor.routeName : (context) => const PrivacyOwnerInvestor(),
        PublishDealScreen.routeName : (context) => PublishDealScreen(),
      },
     
     initialRoute: HomeScreen.routeName,

   ),

  );
  }

}


