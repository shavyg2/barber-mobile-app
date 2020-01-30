import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/component/layout.dart';
import 'package:mobile_app/component/text/label.dart';
import 'package:mobile_app/component/textInput/TextInput.dart';
import 'package:mobile_app/container.dart';
import 'package:mobile_app/controller/animation/shake.dart';
import 'package:mobile_app/controller/login.dart';
import 'package:mobile_app/page/pages.dart';
import 'package:mobile_app/route/BarberAppRouter.dart';
import 'package:mobile_app/screen/homepage.dart';

class LoginView extends StatelessWidget {
  final LoginController controller;
  LoginView(this.controller);

  factory LoginView.instance() {
    return LoginView(container.make<LoginController>());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BarberShop"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Center(
                child: controller.expose((context) {
                  if (controller.failedLogin) {
                    return WidgetAnimation(
                      onStart: (controller) {
                        controller.repeat(
                            reverse: true,
                            period: Duration(
                                milliseconds: ((1000 / 60 * 3).truncate())));
                        Future.delayed(Duration(milliseconds: 300)).then((_) {
                          controller.reset();
                        });
                      },
                      duration: Duration(milliseconds: 30),
                      tween: Tween<double>(begin: -30, end: 30),
                      builder: (context, animation, child) {
                        return Transform.translate(
                          offset: Offset(
                              animation.status == AnimationStatus.dismissed
                                  ? 0
                                  : animation.value,
                              0),
                          child: child,
                        );
                      },
                      child: ErrorTitleLabel(text: controller.errorMessage),
                    );
                  } else {
                    return TitleLabel(
                        text: controller.successMessage.isNotEmpty
                            ? controller.successMessage
                            : "Login",
                        key: Key("welcome-message"));
                  }
                }),
              ),
            ),
            Layout(
              options: "x-2",
              child: Column(
                children: <Widget>[
                  TextInput(
                      controller: controller.usernameController,
                      text: "Username"),
                  TextInput(
                      controller: controller.passwordController,
                      text: "Password"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(alignment: Alignment.bottomLeft,
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context,BarberAppRouter(builder:(context){
                              return getPage().signup();
                            } ));
                          },
                          child:AnchorText(text:"Sign up"),),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: FlatButton(
                          key: Key("login-btn"),
                          child: Text("Login"),
                          onPressed: !controller.busy
                              ? () async {
                                  await controller.login();
                                  if (!controller.failedLogin) {
                                    Navigator.push(context, BarberAppRouter(builder: (context){
                                      return Homepage.instance();
                                    }));
                                  }
                                }
                              : null,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
