import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innovahub_app/Auth/Auth_Cubit/Auth_cubit.dart';
import 'package:innovahub_app/Auth/register/register_screen.dart';
import 'package:innovahub_app/home/Deals/adding_deal_owner.dart';
import 'package:innovahub_app/home/Deals/owner_product.dart';
import 'package:innovahub_app/home/cubit/owner_home_layout_cubit.dart';
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
import 'package:innovahub_app/Products/buy_page.dart';
import 'package:innovahub_app/Products/cart_page.dart';
import 'package:innovahub_app/Products/checkout_address.dart';
import 'package:innovahub_app/Products/product_page.dart';
import 'package:innovahub_app/Auth/login/forget_password.dart';
import 'package:innovahub_app/Auth/login/login_screen.dart';
import 'package:innovahub_app/Auth/login/reset_password.dart';

abstract class AppRouter {
  static const String initRoute = RegisterScreen.routeName;
  static Map<String, Widget Function(BuildContext)> routes() => {
        TrainingPage.routeName: (_) => TrainingPage(),
        SplashScreen.routeName: (_) => const SplashScreen(),
        RegisterScreen.routeName: (_) => BlocProvider(
              create: (context) => AuthCubit(),
              child: const RegisterScreen(),
            ),
        //RegisterDesign.routeName:(_)=>RegisterDesign(),
        // Logindesign.routname:(_) => Logindesign(),
        LoginScreen.routname: (_) => BlocProvider(
              create: (context) => AuthCubit(),
              child: const LoginScreen(),
            ),
        ForgetPasswordScreen.routname: (contect) => ForgetPasswordScreen(),
        resetpassword.routname: (_) => const resetpassword(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        HomeScreenOwner.routeName: (_) => BlocProvider(
              create: (context) => OwnerHomeLayoutCubit(),
              child: const HomeScreenOwner(),
            ),
        // AddingDealOwner.routeName : (_) => AddingDealOwner(),
        HomeScreenInvestor.routeName: (_) => const HomeScreenInvestor(),
        HomeScreenCategories.routeName: (_) => const HomeScreenCategories(),
        ProfileInvestor.routeName: (_) => const ProfileInvestor(),
        ProfileUser.routeName: (_) => const ProfileUser(),
        PrivacyUser.routeName: (_) => const PrivacyUser(),
        PrivacyOwnerInvestor.routeName: (_) => const PrivacyOwnerInvestor(),
        PublishDealScreen.routeName: (_) => const PublishDealScreen(),
        ProductPage.routeName: (_) => const ProductPage(),
        //CartTap.routeName : (_) => CartTap(),
        CartPage.routeName: (_) => const CartPage(),
        BuyPage.routeName: (_) => const BuyPage(),
        CheckoutAddress.routeName: (_) => CheckoutAddress(),
        MyHomePage.routeName: (_) => const MyHomePage(),
        //ProductScreen.routeName : (_) => ProductScreen(),
        //PublishProductPage.routeName : (_) => PublishProductPage(),
        //AddProductScreen.routname : (_) => AddProductScreen(),
      };
}
