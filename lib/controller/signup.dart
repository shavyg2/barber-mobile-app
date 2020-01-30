import 'package:angel_container_generator/angel_container_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile_app/api/Api.dart';
import 'package:mobile_app/container.dart';
import 'package:mobile_app/models/models.dart';
import 'package:mobile_app/util/JsonApi.dart';
import "package:tight/tight.dart";
import "package:mobile_app/service/service.dart";

@contained
class SignupController extends TightController<SignupController> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final UserService userService;

  SignupController({this.userService});

  String get email {
    return emailController.text;
  }

  String get username {
    return usernameController.text;
  }

  String get password {
    return passwordController.text;
  }

  bool failedSignup = false;
  String errorMessage = "";
  String successMessage = "";
  bool success = false;
  JsonApi<SignupResponse> api;

  bool get madeRequest{
    return api!=null;
  }

  Future<void> signup() async {
    final result = await JsonApi.put<SignupResponse>(
        url: getContainer().make<Api>().endpoint(["api/user/signup"]),
        serialize: (json) => signupResponseSerializer.decode(json),
        body: {
          "email":email,
          "username":username,
          "password":password
        });

    if (result.isBad) {
      failedSignup = true;
      errorMessage = result.hasMessage
          ? result.message
          : "Erroring signing up, try again later";
      successMessage = "";
    } else {
      failedSignup = false;
      errorMessage = "";
      successMessage = "Successfully Signed up";
      success = true;
    }

    api = result;

    notifyListeners();
  }
}
