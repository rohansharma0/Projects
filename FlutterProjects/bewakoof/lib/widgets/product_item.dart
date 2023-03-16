import 'package:bewakoof/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../screens/products_detail_screen.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);
    final authData = Provider.of<Auth>(context, listen: false);
    return GridTile(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductDetailScreen.routeName,
            arguments: product.id,
          );
        },
        child: Stack(
          children: <Widget>[
            Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  product.toggleFavoriteStatus(authData.token, authData.userId);
                },
                icon: Icon(product.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border),
                iconSize: 26,
              ),
            ),
          ],
        ),
      ),
      footer: GridTileBar(
        backgroundColor: Colors.white,
        trailing: IconButton(
          icon: const Icon(Icons.add_shopping_cart),
          color: Colors.black,
          onPressed: () {
            cart.addItem(product.id, product.price, product.title);
            Scaffold.of(context).hideCurrentSnackBar();
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: const Text('Added item to cart!'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    cart.removeSingleItem(product.id);
                  },
                ),
              ),
            );
          },
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                product.title,
                style: const TextStyle(color: Colors.black),
                textAlign: TextAlign.start,
              ),
              FittedBox(
                child: Row(
                  children: <Widget>[
                    Text(
                      'Rs ${product.price.toInt()}',
                      style: const TextStyle(color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Rs ${product.oldPrice.toInt()}',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
