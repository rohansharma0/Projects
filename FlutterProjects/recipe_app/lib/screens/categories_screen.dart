import 'package:flutter/material.dart';
import 'package:recipe_app/models/category.dart';
import 'package:recipe_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryList = Dummy_Categries;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        actionsIconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            "Categories",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23),
          ),
        ),
      ),
      body: ListView.builder(
        reverse: true,
        itemBuilder: (ctx, index) {
          return CategoryItem(
            categoryList[index].id,
            categoryList[index].name,
            categoryList[index].imageUrl,
          );
        },
        itemCount: categoryList.length,
      ),
      backgroundColor: Colors.white,
    );
  }
}
