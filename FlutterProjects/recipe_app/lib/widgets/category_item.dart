import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String name;
  final String imageUrl;

  CategoryItem(
    this.id,
    this.name,
    this.imageUrl,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 30,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(17),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              height: 130,
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
            Center(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );

    //  Container(
    //   margin: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
    //   width: double.infinity,
    //   height: 150,
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.circular(17),
    //     child: Stack(
    //       children: <Widget>[
    //         Container(
    //           color: Colors.black,
    //           child: FittedBox(
    //             child,
    //             ),
    //           ),
    //         ),
    //         Align(
    //           alignment: Alignment.center,
    //           child: Text(name),
    //         )
    //       ],
    //     ),
    //   ),
    // Stack(
    //   children: <Widget>[
    //     Image.asset(
    //       imageUrl,
    //       fit: BoxFit.fill,
    //     ),
    //   ],
    // ),
    // );
  }
}
