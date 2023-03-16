import 'package:flutter/material.dart';
import 'package:iphonex_social_app/models/profile.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _detailAnimation;
  Animation<double> _heightAimation;
  final double collapseHeight = 0.45;
  final double expandedHeight = 0.87;
  bool isAnimationDone = false;
  var diviceHeight;

  final PageController _pageController = PageController(
    initialPage: 0,
  );

  var currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    _heightAimation = Tween<double>(begin: expandedHeight, end: collapseHeight)
        .animate(
            CurvedAnimation(curve: Curves.easeInCubic, parent: _controller));
    _detailAnimation =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  void _onBottomTap() {
    setState(() {
      if (isAnimationDone) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
      isAnimationDone = !isAnimationDone;
    });
  }

  void _onVerticalDarg(DragUpdateDetails updateDetails) {
    double draggedHeight = updateDetails.primaryDelta / diviceHeight;
    _controller.value = _controller.value - (5 * draggedHeight);
  }

  void _onVerticalEnd(DragEndDetails endDetails) {
    if (_controller.value >= 0.5) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _detailAnimation.dispose();
    _pageController.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    diviceHeight = MediaQuery.of(context).size.height;
    final double diviceStatusHeight = MediaQuery.of(context).padding.top;
    return AnimatedBuilder(
      animation: _controller,
      builder: (ctx, widget) {
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            FractionallySizedBox(
              alignment: Alignment.topCenter,
              heightFactor: _heightAimation.value,
              child: Stack(
                children: <Widget>[
                  PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                        _detailAnimation.reset();
                        _detailAnimation.forward();
                      });
                    },
                    controller: _pageController,
                    pageSnapping: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((ctx, i) => Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Image.asset(
                              profile[i].imageUrl,
                              fit: BoxFit.cover,
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.3),
                                      Colors.white.withOpacity(0),
                                    ],
                                    stops: [
                                      0.1,
                                      0.9
                                    ]),
                              ),
                            ),
                          ],
                        )),
                    itemCount: profile.length,
                  ),
                  Positioned(
                    top: diviceStatusHeight + 20,
                    left: 20,
                    child: Icon(
                      Icons.person_outline,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                  Positioned(
                    top: diviceStatusHeight + 20,
                    right: 20,
                    child: Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                  Positioned(
                    right: 20,
                    left: 20,
                    bottom: 60,
                    child: ProfileDetail(currentIndex, _detailAnimation),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: _onBottomTap,
              onVerticalDragUpdate: _onVerticalDarg,
              onVerticalDragEnd: _onVerticalEnd,
              child: FractionallySizedBox(
                alignment: Alignment.bottomCenter,
                heightFactor: 1.05 - _heightAimation.value,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Color.fromRGBO(247, 247, 247, 1),
                  ),
                  child: ProfileBottomDetail(currentIndex, _detailAnimation),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class ProfileBottomDetail extends StatefulWidget {
  final int index;
  final AnimationController _hightcontroller;

  ProfileBottomDetail(this.index, this._hightcontroller);
  @override
  ProfileBottomDetailState createState() => ProfileBottomDetailState();
}

class ProfileBottomDetailState extends State<ProfileBottomDetail>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _slideAnimation;
  Animation _fadeAnimation;
  Animation _btnFadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _slideAnimation = TweenSequence([
      TweenSequenceItem<Offset>(
        weight: 10,
        tween: Tween(
          begin: Offset(0, 0),
          end: Offset(0, 0.1),
        ),
      ),
      TweenSequenceItem<Offset>(
        weight: 90,
        tween: Tween(
          begin: Offset(0, 0.1),
          end: Offset(0, 0),
        ),
      )
    ]).animate(widget._hightcontroller);
    _fadeAnimation = TweenSequence([
      TweenSequenceItem<double>(
        weight: 10,
        tween: Tween(
          begin: 1,
          end: 0,
        ),
      ),
      TweenSequenceItem<double>(
        weight: 90,
        tween: Tween(
          begin: 0,
          end: 1,
        ),
      )
    ]).animate(widget._hightcontroller);
    _btnFadeAnimation = TweenSequence([
      TweenSequenceItem<double>(
        weight: 20,
        tween: Tween(
          begin: 1,
          end: 0,
        ),
      ),
      TweenSequenceItem<double>(
        weight: 80,
        tween: Tween(
          begin: 0,
          end: 1,
        ),
      )
    ]).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    widget._hightcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 110,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        profile[widget.index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        '${profile[widget.index].country} ${profile[widget.index].city}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        profile[widget.index].toggleFollow();
                        _controller.reset();
                        _controller.forward();
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      width: (profile[widget.index].isFollow) ? 40 : 100,
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: Colors.red),
                          borderRadius: BorderRadius.circular(50),
                          color: (profile[widget.index].isFollow)
                              ? Colors.red
                              : Colors.white,
                        ),
                        child: FadeTransition(
                          opacity: _btnFadeAnimation,
                          child: (profile[widget.index].isFollow)
                              ? Icon(
                                  Icons.perm_identity,
                                  color: Colors.white,
                                )
                              : Center(
                                  child: Text(
                                    'FOLLOW',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileDetail extends StatefulWidget {
  final int index;
  final AnimationController _controller;
  ProfileDetail(this.index, this._controller);
  @override
  _ProfileDetailState createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail>
    with SingleTickerProviderStateMixin {
  Animation _slideAnimation;
  Animation _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _slideAnimation = TweenSequence([
      TweenSequenceItem<Offset>(
        weight: 10,
        tween: Tween(
          begin: Offset(0, 0),
          end: Offset(0, 0.5),
        ),
      ),
      TweenSequenceItem<Offset>(
        weight: 90,
        tween: Tween(
          begin: Offset(0, 0.5),
          end: Offset(0, 0),
        ),
      )
    ]).animate(widget._controller);
    _fadeAnimation = TweenSequence([
      TweenSequenceItem<double>(
        weight: 10,
        tween: Tween(
          begin: 1,
          end: 0,
        ),
      ),
      TweenSequenceItem<double>(
        weight: 90,
        tween: Tween(
          begin: 0,
          end: 1,
        ),
      )
    ]).animate(widget._controller);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  profile[widget.index].getfollowers,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'followers',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  profile[widget.index].getpost,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'posts',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  profile[widget.index].getfollowings,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'followings',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
