import 'package:flutter/material.dart';
import 'package:iphonex_social_app/profile_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileScreen(),
      bottomNavigationBar: AppBottomBar(),
    );
  }
}

class AppBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      padding: EdgeInsets.fromLTRB(22, 22, 22, 22),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.library_books,
            color: Colors.grey,
            size: 28,
          ),
          Icon(
            Icons.search,
            color: Colors.grey,
            size: 28,
          ),
          Icon(
            Icons.add_circle,
            color: Colors.red,
            size: 55,
          ),
          Icon(
            Icons.alarm,
            color: Colors.grey,
            size: 28,
          ),
          Icon(
            Icons.chat,
            color: Colors.grey,
            size: 28,
          ),
        ],
      ),
    );
  }
}
