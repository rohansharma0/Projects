import 'package:flutter/material.dart';
import 'package:papers/models/category.dart';
import 'package:papers/services/database.dart';
import 'package:papers/widgets/categories_list_view.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Category>>.value(
      value: Database.getCategories,
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(1),
          child: CategoriesListView(),
        ),
      ),
    );
  }
}
