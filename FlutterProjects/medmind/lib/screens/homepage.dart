import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:medmind/models/data.dart';
import 'package:medmind/screens/detail_screen.dart';

class HomePage extends StatelessWidget {
  List<RawData> dummy = [
    RawData(
      id: 'c1',
      title: 'Relax',
      time: 10.0,
      imageUrl: 'assets/images/beach.jpg',
    ),
    RawData(
      id: 'c2',
      title: 'Breathe',
      time: 15.0,
      imageUrl: 'assets/images/forest.jpg',
    ),
    RawData(
      id: 'c3',
      title: 'Sleep',
      time: 25.0,
      imageUrl: 'assets/images/sky.jpg',
    )
  ];
  @override
  Widget build(BuildContext context) {
    final diviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: diviceSize.width,
        height: diviceSize.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu),
                  ),
                  Spacer(),
                  Container(
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/profile.jpg',
                            fit: BoxFit.cover,
                            height: 50,
                            width: 50,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Text(
                'Good\nMorning',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 45),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 230,
              child: Container(
                child: ListView.builder(
                  padding: EdgeInsets.all(5),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: dummy.length,
                  itemBuilder: (ctx, i) => Container(
                    margin: EdgeInsets.only(right: 20),
                    width: 160,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                DetailScreen.routeName,
                                arguments: {
                                  'id': dummy[i].id,
                                  'title': dummy[i].title,
                                  'time': dummy[i].time,
                                  'imageUrl': dummy[i].imageUrl,
                                },
                              );
                            },
                            child: Hero(
                              tag: dummy[i].id,
                              child: Image.asset(
                                dummy[i].imageUrl,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 30, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  dummy[i].title,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${dummy[i].time.round().toString()} Min',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.black45,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
