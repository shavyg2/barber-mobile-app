import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_app/component/layout.dart';
import 'package:mobile_app/component/text/label.dart';
import 'package:mobile_app/component/textInput/TextInput.dart';
import 'package:mobile_app/container.dart';
import 'package:mobile_app/controller/animation/shake.dart';
import 'package:mobile_app/controller/signup.dart';
import 'package:mobile_app/page/pages.dart';
import 'package:mobile_app/route/BarberAppRouter.dart';
import 'package:mobile_app/service/Store/ApplicationStore.dart';
import 'package:mobile_app/util/doImmediately.dart';

class SignupView extends StatelessWidget {
  final SignupController controller;

  SignupView(this.controller);
  factory SignupView.instance() {
    return SignupView(getContainer().make<SignupController>());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
      ),
      body: Layout(
        options: "x-1",
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(child: controller.expose((context) {
                if (!controller.madeRequest) {
                  return TitleLabel(text: "Sign Up");
                } else {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TitleLabel(text: "Signup Failed"),
                      WidgetAnimation(
                        key: Key("${Random.secure().nextDouble()}"),
                        onStart: (controller) {
                          var duration = Duration(
                              milliseconds: (1000 / 60 * 3).truncate());
                          controller
                              .repeat(reverse: true, period: duration);
                          Future.delayed(Duration(milliseconds: 300)).then((_){
                            controller.reset();
                          });
                              
                        },
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
                        tween: Tween<double>(begin: -30, end: 30),
                        child: doImmediately(() {
                          switch (controller.api.statusCode) {
                            case 400:
                              return ErrorLabel(
                                text: "Incorrect Form Data",
                              );
                            default:
                              return ErrorLabel(
                                text: controller.errorMessage,
                              );
                          }
                        }),
                      )
                    ],
                  );
                }
              })),
            ),
            Column(
              children: <Widget>[
                TextInput(
                  text: "Email",
                  controller: controller.emailController,
                ),
                TextInput(
                  text: "Username",
                  controller: controller.usernameController,
                ),
                TextInput(
                  text: "Password",
                  controller: controller.passwordController,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: AnchorText(text: "Signup"),
                  onPressed: () async {
                    await controller.signup();
                    if (controller.success) {

                      final data = controller.api.data;

                      final store = getContainer().make<ApplicationStore>();

                      store.setToken(data.token);
                      store.setUserName(data.user.username);

                      Navigator.popUntil(context, (x)=>x.isFirst);
                      Navigator.pushReplacement(context, BarberAppRouter(builder: (context){
                        return getPage().homepage();
                      }));
                      
                    }
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
