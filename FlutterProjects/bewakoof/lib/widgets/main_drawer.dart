import 'package:bewakoof/screens/user_products_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../screens/Men/men_home_screen.dart';
import '../screens/Women/women_home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/orders_screen.dart';
import '../screens/wishlist_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final auth = Provider.of<Auth>(context);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: statusBarHeight),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 15),
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 60,
              child: const Text(
                'Bewakoof',
                textAlign: TextAlign.start,
                style: const TextStyle(
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
                    padding: const EdgeInsets.all(15),
                    child: const Text(
                      'SHOP IN',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .popAndPushNamed(MenHomeScreen.routeName);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      child: const Text(
                        'Men',
                        style: const TextStyle(
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
                      padding: const EdgeInsets.all(15),
                      child: const Text(
                        'Women',
                        style: const TextStyle(
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
                    onTap: () {
                      auth.isAuth
                          ? Navigator.of(context).popAndPushNamed(
                              WishlistScreen.routeName,
                            )
                          : Navigator.of(context).popAndPushNamed(
                              LoginScreen.routeName,
                            );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      child: const Text(
                        'Wishlist',
                        style:
                            const TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      auth.isAuth
                          ? Navigator.of(context).popAndPushNamed(
                              UserProductsScreen.routeName,
                            )
                          : Navigator.of(context).popAndPushNamed(
                              LoginScreen.routeName,
                            );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      child: const Text(
                        'Manage Products',
                        style:
                            const TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      auth.isAuth
                          ? Navigator.of(context).popAndPushNamed(
                              OrdersScreen.routeName,
                            )
                          : Navigator.of(context).popAndPushNamed(
                              LoginScreen.routeName,
                            );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      child: const Text(
                        'Orders',
                        style:
                            const TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            if (auth.isAuth)
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text('name'),
                    ),
                    Container(
                      child: InkWell(
                        onTap: () {
                          Provider.of<Auth>(context).logout();
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'Log out',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            else
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .popAndPushNamed(LoginScreen.routeName);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(15),
                        child: const Text(
                          'Login',
                          style: const TextStyle(
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
