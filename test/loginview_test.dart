// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/controller/login.dart';
import 'package:mobile_app/screen/loginView.dart';

void main() {
  group("Login View", () {
    LoginController loginController;

    reset() {
      loginController = LoginController();
    }

    Widget make() {
      return MaterialApp(
        home: LoginView(loginController),
      );
    }

    testWidgets('Instanciate', (WidgetTester tester) async {
      reset();
      await tester.pumpWidget(make());
    });

    testWidgets('Can find welcome message', (WidgetTester tester) async {
      reset();
      await tester.pumpWidget(make());

      var welcome = find.byKey(Key("welcome-message"));
      expect(welcome, findsOneWidget);
    });

    testWidgets('Display error message on failed login',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        reset();
        await tester.pumpWidget(make());

        var login = find.byKey(Key("login-btn"));
        expect(login, findsOneWidget);
        // tester.tap(login);
        await loginController.login();
        
        await tester.pump();
        var welcome = find.byKey(Key("welcome-message"));
        var error = find.byKey(Key("error-message"));

        expect(welcome, findsNothing);
        expect(error, findsOneWidget);
      });
    });
  });
}
