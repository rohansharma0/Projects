import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail';
  @override
  Widget build(BuildContext context) {
    final diviceSize = MediaQuery.of(context).size;

    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final title = routeArgs['title'];
    final id = routeArgs['id'];
    final imageUrl = routeArgs['imageUrl'];
    final time = routeArgs['time'];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: (diviceSize.height * 0.5),
            // floating: false,
            pinned: true,
            flexibleSpace: Container(
              margin: EdgeInsets.only(top: 30),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Spacer(),
                        Container(
                          child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/images/profile.jpg',
                                  fit: BoxFit.cover,
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Hero(
                          tag: id,
                          child: Image.asset(
                            imageUrl,
                            width: 500,
                            height: 200,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 100.0,
            delegate: SliverChildListDelegate(
              [
                listItem(
                  Colors.white,
                  "List item 1",
                ),
                listItem(
                  Colors.white,
                  "List item 2",
                ),
                listItem(
                  Colors.white,
                  "List item 3",
                ),
                listItem(
                  Colors.white,
                  "List item 4",
                ),
                listItem(
                  Colors.white,
                  "List item 5",
                ),
                listItem(
                  Colors.white,
                  "List item 6",
                ),
                listItem(
                  Colors.white,
                  "List item 7",
                ),
                listItem(
                  Colors.white,
                  "List item 8",
                ),
                listItem(
                  Colors.white,
                  "List item 9",
                ),
                listItem(
                  Colors.white,
                  "List item 10",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget listItem(Color color, String title) => Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black26,
            width: 1.0,
          ),
        ),
      ),
      child: Center(
        child: Text(
          "$title",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
