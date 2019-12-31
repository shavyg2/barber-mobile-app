import 'package:flutter/cupertino.dart';
import "package:tight/tight.dart";
import "package:mobile_app/service/service.dart";

class SignupController extends TightController<SignupController> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UserService userService =  UserService.instance();

  String get email{
    return emailController.text;
  }
  String get username {
    return usernameController.text;
  }

  String get password {
    return passwordController.text;
  }


  bool failedSignup=false;
  String errorMessage = "";
  String successMessage = "";

  signup() async {
    final result = await userService.signup({
      "email":email,
      "username":username,
      "password":"password"
    });

    if(result.hasError){
      failedSignup = result.hasError;
      errorMessage = result.errorMsg;
      successMessage = "";
    }else{
      failedSignup=false;
      errorMessage = "";
      successMessage = "Successfully Signed up";
    }
    
    notifyListeners();
  }
}
