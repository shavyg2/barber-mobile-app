import 'package:flutter/material.dart';

class WidgetAnimation<T> extends StatefulWidget {
  final Key key;
  final Duration duration;
  final Tween<T> tween;
  final Widget child;
  final Widget Function(
    BuildContext context,
    Animation<T> animation,
    Widget child,
  ) builder;
  final void Function(AnimationController) onStart;

  WidgetAnimation({this.key,@required this.tween, this.duration, @required this.builder,this.child,this.onStart});

  @override
  _WidgetAnimationState createState() => _WidgetAnimationState();
}

class _WidgetAnimationState extends State<WidgetAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  @override
  initState() {
    controller = AnimationController(duration: widget.duration, vsync: this)..addListener((){
      
    });

    if(widget.onStart!=null){
      widget.onStart(controller);
    }else{
      controller.forward();
    }
  }


  @override
  void dispose() {
    super.dispose();
    controller?.stop();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var animation = widget.tween.animate(controller);
    return AnimatedBuilder(
      key:widget.key,
      animation: animation,
      builder: (context, child) {
        return widget.builder(context,animation,child);
      },
      child: widget.child,
    );
  }
}
