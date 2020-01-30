


import 'package:flutter/material.dart';

class BarberAppRouter extends MaterialPageRoute{

  BarberAppRouter({Widget Function(BuildContext) builder}):super(builder:builder,);

  @override
  Duration get transitionDuration => Duration(milliseconds: 300);
}