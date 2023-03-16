import 'package:flutter/material.dart';
import '../../screens/products_overview_screen.dart';

class WomenHomeScreen extends StatelessWidget {
  static const routeName = '/women-section';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: const Text(
          'Women',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: WomenHomePage(),
      backgroundColor: Colors.white,
    );
  }
}

class WomenHomePage extends StatelessWidget {
  void navigation(BuildContext context, String gender, String cat) {
    Navigator.pushNamed(
      context,
      ProductsOverviewScreen.routeName,
      arguments: {
        'gender': gender,
        'category': cat,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ExpansionTile(
            title: const Text('Topwear'),
            initiallyExpanded: false,
            children: <Widget>[
              ListTile(
                onTap: () => navigation(context, 'female', 'half-sleeve'),
                title: const Text('Half Sleeve T-Shirts'),
              ),
              ListTile(
                onTap: () => navigation(context, 'female', 'full-sleeve'),
                title: const Text('Full Sleeve T-Shirts'),
              ),
              ListTile(
                onTap: () => navigation(context, 'female', 'shirt'),
                title: const Text('Shirts'),
              ),
              ListTile(
                onTap: () {},
                title: const Text('View All'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Bottomwear'),
            initiallyExpanded: false,
            children: <Widget>[
              ListTile(
                onTap: () {},
                title: const Text('Joggers'),
              ),
              ListTile(
                onTap: () {},
                title: const Text('Pants & Trouses'),
              ),
              ListTile(
                onTap: () {},
                title: const Text('Shorts'),
              ),
              ListTile(
                onTap: () {},
                title: const Text('View All'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Footwear'),
            initiallyExpanded: false,
            children: <Widget>[
              ListTile(
                onTap: () {},
                title: const Text('Sliders'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
