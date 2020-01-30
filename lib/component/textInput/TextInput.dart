import 'package:flutter/material.dart';
import 'package:mobile_app/component/text/label.dart';

import '../layout.dart';

class TextInput extends StatelessWidget {
  TextEditingController controller;
  String text;

  TextInput({this.controller,this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Layout(options:"t-3 b-1",child: Label(key: Key(text), text: text)),
        TextField(
          controller: controller,
        )
      ],
    );
  }
}
