library label;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/component/layout.dart';


part "anchor.dart";


mixin _Error on Label{
  TextStyle getTextStyle() {
    return super.getTextStyle().copyWith(color: Colors.red);
  }
}


mixin _Anchor on Label{
  TextStyle getTextStyle() {
    return super.getTextStyle().copyWith(color: Colors.blue);
  }
}


mixin _White on Label{

  TextStyle getTextStyle(){
    return super.getTextStyle().copyWith(color: Colors.white);
  }
}


mixin _Title on Label{
  @override
  TextStyle getTextStyle() {
    return super.getTextStyle().copyWith(fontSize: 25);
  }

  @override
  Widget padding(Widget child) {
    return Layout(options:"y-2",child:child);
  }
}
mixin _Subtitle on Label{
  @override
  TextStyle getTextStyle() {
    return super.getTextStyle().copyWith(fontSize: 20);
  }

  @override
  Widget padding(Widget child) {
    return Layout(options:"",child:child);
  }
}

class Label extends StatelessWidget {
  final Key key;
  final String text;

  Label({this.key, this.text});
  @override
  Widget build(BuildContext context) {
    return padding(Text(
      this.text,
      style: this.getTextStyle(),
    ));
  }

  Widget padding(Widget child) {
    return Layout(
      options: "",
      child: child,
    );
  }

  TextStyle getTextStyle() {
    return TextStyle(fontSize: 16);
  }
}

class ErrorLabel extends Label with _Error {
  ErrorLabel({Key key, String text}) : super(key: key, text: text);
}

class TitleLabel extends Label with _Title {
  TitleLabel({Key key, String text}) : super(key: key, text: text);
}


class ErrorTitleLabel extends Label with _Error,_Title {
  ErrorTitleLabel({Key key, String text}) : super(key: key, text: text);
}


class WhiteLabel extends Label with _White{
    WhiteLabel({Key key, String text}) : super(key: key, text: text);
}



class WhiteSubtitleLabel extends Label with _White,_Subtitle{
    WhiteSubtitleLabel({Key key, String text}) : super(key: key, text: text);
}