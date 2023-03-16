import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_item.dart';

class ProductsOverviewScreen extends StatelessWidget {
  static const routeName = '/product-overview';
  final List<Product> loadedProducts = [
    Product(
      id: 'p1',
      title: 'The Night Batman Half Sleeve T-Shirt (BML)',
      // description: ,
      price: 259.00,
      imageUrl:
          'https://images.bewakoof.com/original/the-night-batman-half-sleeve-t-shirt-bml-men-s-printed-t-shirts-231380-1566892415.jpg?tr=q-100',
    ),
    Product(
      id: 'p2',
      title: 'Feel The Burn Half Sleeve T-Shirt',
      // description: ,
      price: 259.00,
      imageUrl:
          'https://images.bewakoof.com/original/feel-the-burn-half-sleeve-t-shirt-men-s-printed-t-shirts-228722-1566024999.jpg?tr=q-100',
    ),
    Product(
      id: 'p3',
      title: 'Doe Bolt Half Sleeve T-Shirt',
      // description: ,
      price: 459.00,
      imageUrl:
          'https://images.bewakoof.com/original/doe-bolt-half-sleeve-t-shirt-men-s-printed-t-shirts-218319-1559648820.jpg?tr=q-100',
    ),
    Product(
      id: 'p4',
      title: 'Play It Loud Half Sleeve T-Shirt',
      // description: ,
      price: 299.00,
      imageUrl:
          'https://images.bewakoof.com/original/play-it-loud-half-sleeve-t-shirt-men-s-printed-t-shirts-209941-1549006235.jpg?tr=q-100',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, i) => ProductItem(
          loadedProducts[i].id,
          loadedProducts[i].title,
          loadedProducts[i].imageUrl,
          loadedProducts[i].price,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.5,
          crossAxisSpacing: 25,
          mainAxisSpacing: 25,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
