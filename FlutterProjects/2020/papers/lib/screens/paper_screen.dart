import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:papers/models/paper.dart';
import 'package:papers/models/user.dart';
import 'package:papers/services/database.dart';
import 'package:papers/utilities/styles.dart';
import 'package:papers/widgets/paper_details.dart';
import 'package:papers/widgets/show_bottom.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class PaperScreen extends StatefulWidget {
  final Paper paper;
  PaperScreen({Key key, @required this.paper}) : super(key: key);

  @override
  _PaperScreenState createState() => _PaperScreenState();
}

class _PaperScreenState extends State<PaperScreen>
    with TickerProviderStateMixin {
  static const platform = const MethodChannel('com.iamrohan.papers/wallpaper');

  User _user;

  AnimationController _controller;

  Animation<double> _heightAnimation;
  Animation _fadeAnimation;
  // Animation _showBottomAnimation;
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

  bool _isloading = false;
  double _download = 0.0;

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
  }

  @override
  void dispose() {
    _controller.dispose();
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

  Future<void> _downloadPaper() async {
    setState(() {
      _isloading = true;
    });
    Dio dio = Dio();
    final imgName = Uuid().v1();
    try {
      var dir = await getExternalStorageDirectory();

      await dio.download(widget.paper.imageUrl, '${dir.path}/$imgName.jpg',
          deleteOnError: true, onReceiveProgress: (rec, total) {
        print('Rec : $rec , Total : $total');
        setState(() {
          _download = rec / total.toDouble();
        });
      });
      Flushbar(
        message: 'Paper saved',
        duration: Duration(seconds: 2),
        backgroundColor: PapersColors.primaryColor,
        isDismissible: true,
      )..show(context);
    } catch (e) {
      print(e);
    }
    setState(() {
      _isloading = false;
      _download = 0.0;
    });
  }

  Future<void> _setPapers() async {
    setState(() {
      _isloading = true;
      _download = null;
    });
    var file = await DefaultCacheManager().getSingleFile(
      widget.paper.imageUrl,
    );
    try {
      await platform.invokeMethod('setWallpaper', [file.path, 1]);
      Flushbar(
        message: 'Paper set as wallpaper.',
        duration: Duration(seconds: 2),
        backgroundColor: PapersColors.primaryColor,
        isDismissible: true,
      )..show(context);
    } catch (e) {
      print(e);
    }
    setState(() {
      _isloading = false;
      _download = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: (_isloading)
          ? Center(
              child: Container(
                decoration: BoxDecoration(
                    color: PapersColors.primaryColor,
                    borderRadius: BorderRadius.circular(5)),
                height: 150,
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    (_download != null)
                        ? CircularProgressIndicator(
                            value: _download,
                          )
                        : CircularProgressIndicator(),
                    SizedBox(height: 20),
                    (_download != null)
                        ? Text(
                            (_download <= 1.0)
                                ? _download.toStringAsFixed(2)
                                : 'Complete',
                            style: TextStyle(color: Colors.white),
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ),
            )
          : Container(
              child: GestureDetector(
                onVerticalDragUpdate: _onVerticalDragUpdate,
                onVerticalDragEnd: _onVerticalDragEnd,
                onVerticalDragCancel: _onVerticalDragCancel,
                child: Stack(
                  children: <Widget>[
                    Hero(
                      tag: widget.paper.id,
                      child: GestureDetector(
                        onHorizontalDragStart: _onHorizontalDragStart,
                        onHorizontalDragUpdate: _onHorizontalDragUpdate,
                        onHorizontalDragEnd: _onHorizontalDragEnd,
                        onHorizontalDragCancel: _onHorizontalDragCancel,
                        onScaleStart: _onScaleStart,
                        onScaleUpdate: _onScaleUpdate,
                        onScaleEnd: _onScaleEnd,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: deviceSize.height,
                              child: Transform(
                                alignment: FractionalOffset(
                                    _scaleOffsetDx / deviceSize.width,
                                    _scaleOffsetDy / deviceSize.height),
                                transform: Matrix4.diagonal3(
                                    Vector3(_scale, _scale, _scale)),
                                child: Image(
                                  alignment: FractionalOffset(_align, 0),
                                  image: CachedNetworkImageProvider(
                                      widget.paper.thumbnailImageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.transparent,
                                    PapersColors.primaryColor.withOpacity(0.25),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
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
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: IconButton(
                          onPressed: _downloadPaper,
                          icon: Icon(
                            PapersIcons.download,
                            color: PapersColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: IconButton(
                          onPressed: _setPapers,
                          icon: Icon(
                            PapersIcons.image,
                            color: PapersColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: ShowBottomIcon(),
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
            ),
    );
  }
}
