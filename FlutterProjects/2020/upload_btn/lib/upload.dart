import 'package:flutter/material.dart';

class UploadButton extends StatefulWidget {
  @override
  _UploadButtonState createState() => _UploadButtonState();
}

class _UploadButtonState extends State<UploadButton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _scaleAnimation;
  Animation _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.15,
    ).animate(CurvedAnimation(
      curve: Curves.easeOut,
      parent: _controller,
    ));

    _slideAnimation = Tween<double>(
      begin: 0.0,
      end: 170.0,
    ).animate(CurvedAnimation(
      curve: Curves.easeOut,
      parent: _controller,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          alignment: Alignment.center,
          child: child,
        );
      },
      child: GestureDetector(
        onTap: () {
          _controller.forward();
          print('df');
        },
        child: Container(
          height: deviceSize.height * 0.08,
          width: deviceSize.width * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xff3ab44a),
            boxShadow: [
              BoxShadow(
                  color: Color(0x853ab44a),
                  blurRadius: 20,
                  spreadRadius: 6,
                  offset: Offset(0, 2))
            ],
          ),
          child: AnimatedBuilder(
            animation: _slideAnimation,
            builder: (context, child) {
              return Transform(
                transform:
                    Matrix4.translationValues(_slideAnimation.value, 0, 0),
                child: child,
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.cloud_upload,
                  size: 42,
                  color: Colors.white,
                ),
                SizedBox(width: 20),
                Text(
                  'Upload',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
