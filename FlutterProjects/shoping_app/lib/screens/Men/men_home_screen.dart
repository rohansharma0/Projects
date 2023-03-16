import 'package:flutter/material.dart';
import 'package:shoping_app/screens/products_overview_screen.dart';

class MenHomeScreen extends StatelessWidget {
  static const routeName = '/men-section';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Men',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
            color: Colors.black,
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
            color: Colors.black,
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: MenHomePage(),
      backgroundColor: Colors.white,
    );
  }
}

class MenHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ExpansionTile(
            title: Text('Topwear'),
            initiallyExpanded: false,
            children: <Widget>[
              ListTile(
                onTap: () {
                  Navigator.pushNamed(
                      context, ProductsOverviewScreen.routeName);
                },
                title: Text('Half Sleeve T-Shirts'),
              ),
              ListTile(
                onTap: () {},
                title: Text('Full Sleeve T-Shirts'),
              ),
              ListTile(
                onTap: () {},
                title: Text('Shirts'),
              ),
              ListTile(
                onTap: () {},
                title: Text('View All'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Bottomwear'),
            initiallyExpanded: false,
            children: <Widget>[
              ListTile(
                onTap: () {},
                title: Text('Joggers'),
              ),
              ListTile(
                onTap: () {},
                title: Text('Pants & Trouses'),
              ),
              ListTile(
                onTap: () {},
                title: Text('Shorts'),
              ),
              ListTile(
                onTap: () {},
                title: Text('View All'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Footwear'),
            initiallyExpanded: false,
            children: <Widget>[
              ListTile(
                onTap: () {},
                title: Text('Sliders'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
