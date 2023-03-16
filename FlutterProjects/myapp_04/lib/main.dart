import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:myapp_04/screens/product_detail_screen.dart';
import 'package:myapp_04/screens/products_overview_screen.dart';
import './providers/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (ctx) => Products(),
      child: MaterialApp(
        title: 'MyShop',
        home: ProductsOverviewScreen(),
        theme: ThemeData(fontFamily: 'Nunito'),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}
