import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:recipe_app/models/product.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsList = Dummy_Products;

    double statusBarheight = 50.0;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Container(
                margin: EdgeInsets.only(top: statusBarheight),
                padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                child: Material(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  elevation: 20,
                  child: TextFormField(
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                        size: 20,
                        color: Color.fromRGBO(165, 165, 165, 1),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(15, 12, 0, 12),
                      hintText: 'Search Food',
                      hintStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                      border: InputBorder.none,
                    ),
                    cursorColor: Colors.grey,
                    cursorRadius: Radius.circular(10),
                    maxLines: 1,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: DefaultTabController(
                length: 4,
                child: TabBar(
                  isScrollable: false,
                  labelColor: Colors.black,
                  indicatorColor: Colors.black,
                  labelPadding: EdgeInsets.all(0),
                  unselectedLabelColor: Colors.grey,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                    fontSize: 15,
                  ),
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: <Widget>[
                    Tab(
                      text: 'breakfast',
                    ),
                    Tab(text: 'lunch'),
                    Tab(text: 'dinner'),
                    Tab(text: 'news'),
                  ],
                ),
              ),
            ),
            Container(
              height: 400,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return Container(
                    margin: EdgeInsets.all(15),
                    width: 250,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(17),
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: <Widget>[
                          Image.asset(
                            productsList[index].imageUrl,
                            fit: BoxFit.cover,
                            height: 400,
                            width: double.infinity,
                          ),
                          Positioned.fill(
                            child: BackdropFilter(
                              filter: prefix0.ImageFilter.blur(
                                sigmaX: 1,
                                sigmaY: 1,
                              ),
                              child: Container(
                                color: Colors.black.withOpacity(0.4),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 25, horizontal: 25),
                            child: Text(
                              productsList[index].name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: productsList.length,
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Popular',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: double.infinity,
                    height: 70,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(17),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/cat-1.jpg',
                            height: 70,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Positioned.fill(
                            child: BackdropFilter(
                              filter: prefix0.ImageFilter.blur(
                                sigmaX: 1,
                                sigmaY: 1,
                              ),
                              child: Container(
                                color: Colors.black.withOpacity(0.4),
                              ),
                            ),
                          ),
                          Text(
                            'Soups',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: double.infinity,
                    height: 70,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(17),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/cat-2.jpg',
                            height: 70,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Positioned.fill(
                            child: BackdropFilter(
                              filter: prefix0.ImageFilter.blur(
                                sigmaX: 1,
                                sigmaY: 1,
                              ),
                              child: Container(
                                color: Colors.black.withOpacity(0.4),
                              ),
                            ),
                          ),
                          Text(
                            'Desserts',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
