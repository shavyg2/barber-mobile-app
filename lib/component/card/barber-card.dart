import 'package:flutter/material.dart';
import 'package:mobile_app/component/layout.dart';
import 'package:mobile_app/component/text/label.dart';

class BarberCard extends StatelessWidget {
  final String profileImage;
  final String username;

  BarberCard({
    this.profileImage,
    this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: Container(
        color: Colors.grey[100],
        child: Layout(
          options: "a-1",
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image:
                            DecorationImage(image: NetworkImage(profileImage))),
                  )
                ],
              ),
              Expanded(
                child: Layout(
                  options: "l-3",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Label(text: username)],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
