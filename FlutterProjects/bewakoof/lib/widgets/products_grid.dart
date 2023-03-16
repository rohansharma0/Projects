import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  final Map<String, String> selectedCategory;
  ProductsGrid(this.selectedCategory);
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final genderSelectedProducts = productData.items.where((prod) {
      return prod.gender == selectedCategory['gender'];
    }).toList();
    final products = genderSelectedProducts.where((prod) {
      return prod.category == selectedCategory['category'];
    }).toList();
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
        crossAxisSpacing: 25,
        mainAxisSpacing: 25,
      ),
    );
  }
}
