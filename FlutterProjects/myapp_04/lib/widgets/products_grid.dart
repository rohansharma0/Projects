import 'package:flutter/material.dart';
import 'package:myapp_04/providers/products.dart';
import 'package:provider/provider.dart';
import 'package:myapp_04/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return GridView.builder(
      padding: EdgeInsets.all(5),
      itemBuilder: (ctx, i) {
        return ProductItem(
          products[i].id,
          products[i].title,
          products[i].imageUrl,
        );
      },
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }
}
