import 'package:flutter/material.dart';
import 'package:papers/utilities/styles.dart';

class CustomAppBar extends StatefulWidget {
  final String title;
  final List<Widget> actionIcons;
  CustomAppBar({Key key, this.actionIcons, this.title}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: AppBar(
        elevation: 0,
        title: (widget.title != null)
            ? Text(
                widget.title,
              )
            : SizedBox.shrink(),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: widget.actionIcons,
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(PapersIcons.menu),
        ),
      ),
    );
  }
}
