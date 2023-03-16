import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

import '../widgets/main_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Bewakoof',
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
      body: HomePage(),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      drawerScrimColor: Colors.black45,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ImageCarousel(),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Top Categories',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: 80,
                          height: 3,
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Image.network(
                          'https://images.bewakoof.com/t540/it-s-my-life-music-a5-notebook-soft-bound-notebook-225976-1566369179.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Center(
                        child: Text(
                          'NoteBooks',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Image.network(
                          'https://images.bewakoof.com/original/punk-skull-full-sleeve-t-shirt-men-s-printed-full-sleeve-t-shirt-230401-1566371948.jpg?tr=q-100',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Center(
                        child: Text(
                          'Full Sleeves',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Image.network(
                          'https://images.bewakoof.com/t540/jet-black-round-pocket-fleece-joggers-men-s-plain-basic-round-pocket-jogger-pants-167573-1546604176.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Center(
                        child: Text(
                          'Joggers',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Hot Right Now',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: 100,
                          height: 3,
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: Image.network(
                            'https://images.bewakoof.com/uploads/grid/app/Cute-Peeking-Cat-Round-Neck-34th-Sleeve-T-Shirt-desktop-1566558551.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: Image.network(
                            'https://images.bewakoof.com/uploads/grid/app/Regency-Stripe-Mandarin-Collar-Shirt-desktop-1566558552.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImageCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      child: Carousel(
        animationCurve: Curves.decelerate,
        animationDuration: Duration(milliseconds: 300),
        images: [
          NetworkImage(
              'https://images.bewakoof.com/uploads/grid/app/26-08-final-last-chance-banner-1566819162.jpg'),
          NetworkImage(
              'https://images.bewakoof.com/uploads/grid/app/27-8-dotd-desktop-collab-1566895734.jpg'),
          NetworkImage(
              'https://images.bewakoof.com/uploads/grid/app/27-8-dotd-originals-desktop-1566898473.jpg'),
          NetworkImage(
              'https://images.bewakoof.com/uploads/grid/app/banner-notebook-desktop-1566454270.jpg'),
        ],
        boxFit: BoxFit.cover,
        dotBgColor: Colors.transparent,
        dotSize: 8,
        dotIncreaseSize: 1.5,
        dotColor: Colors.white54,
        dotIncreasedColor: Colors.yellow,
        dotPosition: DotPosition.bottomCenter,
        dotVerticalPadding: 0,
        indicatorBgPadding: 5,
        autoplay: true,
        autoplayDuration: Duration(seconds: 4),
      ),
    );
  }
}
