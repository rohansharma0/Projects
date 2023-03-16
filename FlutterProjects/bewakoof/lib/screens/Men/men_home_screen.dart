import 'package:flutter/material.dart';
import '../../screens/products_overview_screen.dart';

class MenHomeScreen extends StatelessWidget {
  static const routeName = '/men-section';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: const Text(
          'Men',
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: MenHomePage(),
      backgroundColor: Colors.white,
    );
  }
}

class MenHomePage extends StatelessWidget {
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
                onTap: () => navigation(context, 'male', 'half-sleeve'),
                title: const Text('Half Sleeve T-Shirts'),
              ),
              ListTile(
                onTap: () => navigation(context, 'male', 'full-sleeve'),
                title: const Text('Full Sleeve T-Shirts'),
              ),
              ListTile(
                onTap: () => navigation(context, 'male', 'shirt'),
                title: const Text('Shirts'),
              ),
              // ListTile(
              //   onTap: () => navigation(context, 'male', ''),
              //   title: Text('View All'),
              // ),
            ],
          ),
          ExpansionTile(
            title: const Text('Bottomwear'),
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
              // ListTile(
              //   onTap: () {},
              //   title: Text('View All'),
              // ),
            ],
          ),
          ExpansionTile(
            title: const Text('Footwear'),
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
