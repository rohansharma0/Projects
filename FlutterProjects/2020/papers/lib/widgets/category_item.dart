import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:papers/models/category.dart';
import 'package:papers/screens/category_papers_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({Key key, @required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(1),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  CategoryPapersScreen(category: category),
            ),
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: deviceSize.height * 0.35,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      CachedNetworkImageProvider(category.backgroundImageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: deviceSize.height * 0.35,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.25),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              top: 0,
              right: 0,
              child: Center(
                child: Text(
                  category.title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
