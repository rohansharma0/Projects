import 'package:flutter/material.dart';
import 'package:papers/models/category.dart';
import 'package:papers/widgets/category_item.dart';
import 'package:provider/provider.dart';

class CategoriesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _categories = Provider.of<List<Category>>(context);

    return (_categories != null)
        ? ListView.builder(
            itemCount: _categories.length,
            itemBuilder: (BuildContext context, int index) {
              final category = _categories[index];
              return CategoryItem(
                category: category,
              );
            },
          )
        : Center(
            child: CircularProgressIndicator(
              strokeWidth: 1.0,
            ),
          );
  }
}
