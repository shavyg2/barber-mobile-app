

import 'package:angel_container_generator/angel_container_generator.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/container.dart';
import 'package:mobile_app/screen/homepage.dart';
import 'package:mobile_app/screen/loginView.dart';
import 'package:mobile_app/screen/signupView.dart';

@contained
class Pages {
  Widget login(){
    return LoginView.instance(); 
  }

  Widget signup(){
    return SignupView.instance();
  }

  Widget homepage(){
    return Homepage.instance();
  }
}

Pages getPage(){
  return getContainer().make<Pages>();
}