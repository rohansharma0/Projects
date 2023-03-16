import 'package:flutter/material.dart';

import '../screens/Men/men_home_screen.dart';
import '../screens/Women/women_home_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: statusBarHeight),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 15),
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 60,
              child: Text(
                'Bewakoof',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'SHOP IN',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .popAndPushNamed(MenHomeScreen.routeName);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Men',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .popAndPushNamed(WomenHomeScreen.routeName);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Women',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
