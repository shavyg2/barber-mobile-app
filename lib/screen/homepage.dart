import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:mobile_app/component/app_screen/app_screen.dart';
import 'package:mobile_app/component/card/barber-card.dart';
import 'package:mobile_app/component/layout.dart';
import 'package:mobile_app/component/text/label.dart';
import 'package:mobile_app/container.dart';
import 'package:mobile_app/controller/homepage.dart';

class Homepage extends StatefulWidget {
  HomepageController controller;
  Homepage(this.controller);

  factory Homepage.instance() {
    final controller = getContainer().make<HomepageController>();
    return Homepage(controller);
  }

  @override
  _HomepageState createState() => _HomepageState();
}

const ContentOpacity = "content-opacity";

class _HomepageState extends State<Homepage>
    with TickerProviderStateMixin {
  AnimationController playlist;
  SequenceAnimation animation;
  void initState() {
    super.initState();
    playAnimations();
    
  }


  playAnimations(){

      playlist?.dispose();
      playlist = AnimationController(vsync: this);

    animation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 40, end: 0),
            from: Duration(milliseconds: 500),
            to: Duration(milliseconds: 1000),
            tag: "header",
            curve: Curves.easeOut)
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: Duration(milliseconds: 500),
            to: Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            tag: "opacity")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: Duration(milliseconds: 700),
            to: Duration(milliseconds: 1200),
            curve: Curves.easeOut,
            tag: ContentOpacity)


        .addAnimatable(
          animatable: Tween<double>(begin: 0.9,end:1),
          from:Duration(milliseconds: 800),
          to:Duration(milliseconds: 900),
          curve: Curves.easeOut,
          tag:"spring"
        )
        .animate(playlist);

    playlist.addListener(() => setState(() {}));

    playlist.forward();
  }

  HomepageController get controller {
    return widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      header: Opacity(
        opacity: animation["opacity"].value,
        child: Material(
          elevation: 7,
          child: Container(
            padding: EdgeInsets.only(top: animation["header"].value),
            color: Colors.red,
            child: SafeArea(
              child: Layout(
                options: "a-2 b-3",
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WhiteSubtitleLabel(text: "The Shop"),
                    WhiteLabel(text: widget.controller.username)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Transform.scale(
              scale: animation["spring"].value,
              child: Opacity(
          opacity: animation[ContentOpacity].value,
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Layout(
                    options: "a-2 r-2",
                    child: Icon(
                      Icons.filter_list,
                      color: Colors.grey[900],
                    )),
              ),
              Layout(
                  options: "a-3",
                  child: BarberCard(
                    profileImage:
                        "https://media.licdn.com/dms/image/C5603AQFc-rFg2w6thQ/profile-displayphoto-shrink_200_200/0?e=1583366400&v=beta&t=vuiDz23PKEvy49ZczPHpt7g-g37awlA3eKehl-ZJwpA",
                    username: "Billy",
                  ))
            ],
          ),
        ),
      ),
      footer: GestureDetector(
        onTap: (){
          playAnimations();
        },
        child: Layout(options: "a-2", child: Text("restart")),
      ),
    );
  }
}
