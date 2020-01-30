import 'package:flutter/material.dart';

class AppScreen extends StatelessWidget {
  Widget header;
  Widget body;
  Widget footer;
  Color backgroundColor;

  AppScreen({
    this.header,
    this.body,
    this.footer,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: backgroundColor ?? Colors.white,
        child: Column(
          children: [
            if (header != null) header,
            if (body != null) Expanded(child: body),
            if (footer!=null) footer,
          ],
        ),
      ),
    );
  }
}
