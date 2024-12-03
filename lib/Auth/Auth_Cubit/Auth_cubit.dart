
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:innovahub_app/Auth/Auth_Cubit/Auth_states.dart';       // object from http package to access http methods:

 // Cubit: that contain Functions of Auth api:
class AuthCubit extends Cubit <AuthStates>{

  AuthCubit():super(AuthIntialState());

  static const String baseUrl = 'https://innovahub-d3etetfzh6ada8aq.uaenorth-01.azurewebsites.net/api/Account/';
  static const String registerApi = '$baseUrl/register';                 // register api:
  static const String loginApi = '$baseUrl/login';                      // login api:
  static const String forgetPasswordApi = '$baseUrl/forgetPassword';   // forget password api:
  static const String resetPasswordApi = '$baseUrl/resetPassword';    // reset password api:
  static const String rolesApi = '$baseUrl/roles';                   // roles of users api:
  static const String googleLoginApi = '$baseUrl/googleLogin';      // googleLogin api:


 // Method of Register => http (post) => request:

    Future <void>  register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String city,
    required String country,
    required String district,
    required String phoneNumber,
    required String roleId,
    })async{
   
     emit(RegisterLoadingState());        // show loading for User: 
    // call Api:

    try{
      Response response =await http.post(           // store the response that return from api:
     Uri.parse(registerApi),
     
     // send data to database: 
     body: jsonEncode({
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
          "city": city,
          "phoneNumber": phoneNumber,
          "district": district,
          "country": country,
          "roleId": roleId,
        }),
      );

    
     
     if(response.statusCode == 200 || response.statusCode == 201){

     emit(RegisterSuccessState());    // emit Success state:

     }

     else{

       var responseBody = jsonDecode(response.body);       // convert json to map:(parsing):
       // emit failed:
       emit(RegisterErrorStata(message: responseBody['message'] ?? 'Failed to register'));     // to access value of message:

   }

  }  
  
  catch(e){

   emit(RegisterErrorStata(message: 'Error: $e'));

  }

  }


    // Login:
  
   Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());

    try {
      final response = await http.post(
        Uri.parse(loginApi),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['state'] == true) {
          emit(LoginSuccessState(
             message: data['message'    // Corrected parameter name to 'message'
             ])); 
        }
         else {
          emit(LoginErrorState(message: data['message']));
        }
      } else {
        emit(LoginErrorState(message: 'Login failed. Please try again.'));
      }
    } catch (e) {
      emit(LoginErrorState(
          message:'An error occurred: ${e.toString()}'));     // Improved error message
    
    }
  }

    
  

  }
