


abstract class AuthStates{


}

class AuthIntialState extends AuthStates{}

class RegisterLoadingState  extends AuthStates{}


class RegisterSuccessState  extends AuthStates{} 

class RegisterErrorStata  extends AuthStates{
 String message;

 RegisterErrorStata({required this.message});             
  
} 



 class LoginLoadingState extends AuthStates{} 
 class LoginSuccessState extends AuthStates{
   String message;
  LoginSuccessState({required this.message});
 } 

 class LoginErrorState extends AuthStates{
  String message;

 LoginErrorState({required this.message});             
  
 } 
