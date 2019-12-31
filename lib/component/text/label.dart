



import 'package:flutter/cupertino.dart';

class Label extends StatelessWidget{
  Key key;
  String text;

  Label({this.key,this.text});
  @override
  Widget build(BuildContext context) {
    return Text(this.text);
  }

}