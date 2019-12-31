import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/component/text/label.dart';
import 'package:mobile_app/controller/login.dart';

class LoginView extends StatelessWidget {
  final LoginController controller;
  LoginView(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BarberShop"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          controller.expose((context) {
            if (controller.failedLogin) {
              return Container(
                key: Key("error-message"),
                child: Text(
                  controller.errorMessage,
                ),
              );
            } else {
              return Text("Login", key: Key("welcome-message"));
            }
          }),
          Column(
            children: <Widget>[
              Label(key: Key("username"), text: "username"),
              TextField(
                controller: controller.usernameController,
              )
            ],
          ),
          Column(
            children: <Widget>[
              Label(key: Key("password"), text: "password"),
              TextField(
                controller: controller.passwordController,
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FlatButton(
              key: Key("login-btn"),
              child: Text("Login"),
              onPressed: () async {
                await controller.login();

                if (!controller.failedLogin) {
                  //do next stuff
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
