import 'package:bewakoof/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './cart_screen.dart';
import '../providers/cart.dart';
import '../providers/product.dart';
import '../widgets/badge.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<Products>(context).findById(productId);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          loadedProduct.title,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
            color: Colors.black,
          ),
          Consumer<Cart>(
            builder: (_, cartData, child) => Badge(
              child: child,
              value: cartData.itemCount.toString(),
            ),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              color: Colors.black,
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Text(loadedProduct.title),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Rs ${loadedProduct.price.toInt()}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(width: 10),
                Text(
                  'Rs ${loadedProduct.oldPrice.toInt()}',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: GestureDetector(
          onTap: () {
            cart.addItem(
                loadedProduct.id, loadedProduct.price, loadedProduct.title);
          },
          child: Container(
            height: 50,
            color: Color.fromRGBO(0, 150, 136, 1),
            child: Center(
              child: const Text(
                'ADD TO CART',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FavButton(loadedProduct: loadedProduct),
    );
  }
}

class FavButton extends StatefulWidget {
  const FavButton({
    Key key,
    @required this.loadedProduct,
  }) : super(key: key);

  final Product loadedProduct;

  @override
  _FavButtonState createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  @override
  Widget build(BuildContext context) {
    final authData = Provider.of<Auth>(context, listen: false);

    var isfav = widget.loadedProduct.isFavorite;
    return FloatingActionButton(
      onPressed: () {
        widget.loadedProduct
            .toggleFavoriteStatus(authData.token, authData.userId);
        setState(() {
          isfav = !isfav;
        });
      },
      child: Icon(isfav ? Icons.favorite : Icons.favorite_border),
    );
  }
}
