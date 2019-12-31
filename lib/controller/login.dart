import 'package:flutter/cupertino.dart';
import "package:tight/tight.dart";
import "package:mobile_app/service/service.dart";

class LoginController extends TightController<LoginController> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UserService userService =  UserService.instance();

  String get username {
    return usernameController.text;
  }

  String get password {
    return passwordController.text;
  }


  bool failedLogin=false;
  String errorMessage = "";
  String successMessage = "";

  Future<void> login() async {
    final result = await userService.login({
      "username":username,
      "password":"password"
    });

    if(result.hasError){
      failedLogin = result.hasError;
      errorMessage = result.errorMsg?? "unknown error failed to signup";
      successMessage = "";
    }else{
      failedLogin=false;
      errorMessage = "";
      successMessage = "Successfully Logged in";
    }
    
    notifyListeners();
  }
}
