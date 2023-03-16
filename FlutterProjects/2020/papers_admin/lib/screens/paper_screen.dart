import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:papers_admin/models/paper.dart';
import 'package:papers_admin/models/user.dart';
import 'package:papers_admin/services/database.dart';
import 'package:papers_admin/widgets/paper_details.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class PaperScreen extends StatefulWidget {
  final Paper paper;
  PaperScreen({Key key, @required this.paper}) : super(key: key);

  @override
  _PaperScreenState createState() => _PaperScreenState();
}

class _PaperScreenState extends State<PaperScreen>
    with TickerProviderStateMixin {
  User _user;

  AnimationController _controller;
  AnimationController _showBottomController;

  Animation<double> _heightAnimation;
  Animation _fadeAnimation;
  Animation _showBottomAnimation;
  Size deviceSize;
  // Aligning image when draged left or right

  double _align = 0.5;
  // double _previousAlign = 0.5;

  // scalling of images
  bool _isScaleCheck = true;

  double _scaleOffsetDx = 0.5;
  double _scaleOffsetDy = 0.5;

  double _scale = 1.0;
  double _previousScale = 1.0;

  // drag bottom sheet

  double initialPos = -250.0;
  double finalPos = 0.0;

  @override
  void initState() {
    super.initState();
    _getAuthorUser();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    _heightAnimation = Tween<double>(
      begin: initialPos,
      end: finalPos,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _fadeAnimation = Tween(
      begin: 0.2,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    // _showBottomAnimation = Tween(
    //   begin: 3,
    //   end: -3,
    // ).animate(CurvedAnimation(
    //   parent: _showBottomController,
    //   curve: Curves.fastOutSlowIn,
    // ));

    // _showBottomController.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _showBottomController?.dispose();
    super.dispose();
  }

  _getAuthorUser() async {
    final user = await Database.getUserWithId(widget.paper.authorId);
    setState(() {
      _user = user;
    });
  }

  void _onHorizontalDragStart(DragStartDetails details) {
    // _previousAlign = _align;
    // _align = _previousAlign;
    // setState(() {});
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    _align = (1 - details.globalPosition.dx / deviceSize.width);
    setState(() {});
  }

  void _onHorizontalDragCancel() {
    // _align = 0.5;
    // _previousAlign = 0.5;
  }

  void _onHorizontalDragEnd(DragEndDetails endDetails) {
    // _previousAlign = 0.5;
    // setState(() {});
  }

  void _onScaleStart(ScaleStartDetails details) {
    if (_isScaleCheck) {
      _scaleOffsetDx = details.focalPoint.dx;
      _scaleOffsetDy = details.focalPoint.dy;
      _isScaleCheck = false;
    }
    _previousScale = _scale;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    if (details.scale >= 1) {
      _scale = _previousScale * details.scale;
    }
    setState(() {});
  }

  void _onScaleEnd(ScaleEndDetails details) {
    _previousScale = 1.0;
    _scale = 1.0;
    _isScaleCheck = true;
    setState(() {});
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    double dragHeigh = details.primaryDelta / deviceSize.height;
    _controller.value = _controller.value - (4 * dragHeigh);
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    if (_controller.value >= 0.4) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  void _onVerticalDragCancel() {
    if (_controller.value >= 0.3) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: _onVerticalDragUpdate,
        onVerticalDragEnd: _onVerticalDragEnd,
        onVerticalDragCancel: _onVerticalDragCancel,
        child: Stack(
          children: <Widget>[
            Hero(
              tag: widget.paper.id,
              child: Stack(
                children: <Widget>[
                  GestureDetector(
                    onHorizontalDragStart: _onHorizontalDragStart,
                    onHorizontalDragUpdate: _onHorizontalDragUpdate,
                    onHorizontalDragEnd: _onHorizontalDragEnd,
                    onHorizontalDragCancel: _onHorizontalDragCancel,
                    onScaleStart: _onScaleStart,
                    onScaleUpdate: _onScaleUpdate,
                    onScaleEnd: _onScaleEnd,
                    child: Container(
                      height: deviceSize.height,
                      child: Transform(
                        alignment: FractionalOffset(
                            _scaleOffsetDx / deviceSize.width,
                            _scaleOffsetDy / deviceSize.height),
                        transform:
                            Matrix4.diagonal3(Vector3(_scale, _scale, _scale)),
                        child: Image(
                          alignment: FractionalOffset(_align, 0),
                          image: CachedNetworkImageProvider(
                              widget.paper.thumbnailImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //       begin: FractionalOffset.topCenter,
                  //       end: FractionalOffset.bottomRight,
                  //       colors: [
                  //         Colors.black.withOpacity(0.2),
                  //         Colors.transparent,
                  //         Colors.black.withOpacity(0.2),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeIn,
              child: Positioned(
                top: 30,
                left: 10,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Container(
                height: 50,
                width: 50,
                color: Colors.white,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.file_download),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: Container(
                height: 50,
                width: 50,
                color: Colors.white,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.wallpaper),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child:
                  // AnimatedBuilder(
                  //   animation: _showBottomAnimation,
                  //   builder: (context, child) {
                  //     return
                  Transform(
                transform: Matrix4.translationValues(0, 5, 0),
                // child: child,
                // );
                // },
                child: Center(
                  child: Icon(
                    Icons.keyboard_arrow_up,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _heightAnimation,
              builder: (context, child) {
                return Positioned(
                  bottom: _heightAnimation.value,
                  right: 0,
                  left: 0,
                  height: 250,
                  child: child,
                );
              },
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  child: PaperDetails(
                    paper: widget.paper,
                    user: _user,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
