import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobile_app/api/Request/Request.dart';
import 'package:mobile_app/models/models.dart';
import 'package:mobile_app/service/Store/ApplicationStore.dart';
import "package:tight/tight.dart";
import "package:mobile_app/service/service.dart";

class LoginController extends TightController<LoginController> {

  Request request;
  UserService userService;
  LoginController(this.request, this.userService);

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String get username {
    return usernameController.text;
  }

  String get password {
    return passwordController.text;
  }

  bool busy = false;
  bool failedLogin = false;
  String errorMessage = "";
  String successMessage = "";

  Future<void> login() async {
    busy = true;
    failedLogin=false;
    notifyListeners();
    final result = await userService
        .login({"username": username, "password": password}).catchError((err) {
      return LoginResult(null, {});
    });

    if (result.hasError) {
      failedLogin = result.hasError;
      errorMessage = result.hasMessage ?? "Error Logging In";
      successMessage = "";
    } else {
      failedLogin = false;
      errorMessage = "";
      successMessage = "Successfully Logged in";

      final data =  result.data;

      getStore()
      ..setUserName(data.user.username)
      ..setToken(data.token);

    }
    busy = false;
    notifyListeners();
  }
}
