import 'package:flutter/material.dart';

class ShowBottomIcon extends StatefulWidget {
  @override
  _ShowBottomIconState createState() => _ShowBottomIconState();
}

class _ShowBottomIconState extends State<ShowBottomIcon>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 100),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 10.0,
    ).animate(CurvedAnimation(
      curve: Curves.easeIn,
      parent: _controller,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.translationValues(0, _animation.value, 0),
            child: child,
          );
        },
        child: Center(
          child: Icon(
            Icons.keyboard_arrow_up,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
