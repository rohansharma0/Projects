import 'package:flutter/material.dart';
import 'package:testapp/home_screens/create_post_screen.dart';
import 'package:testapp/home_screens/feed_screen.dart';
import 'package:testapp/home_screens/notification_screen.dart';
import 'package:testapp/home_screens/search_screen.dart';
import 'package:testapp/home_screens/user_profile_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          FeedScreen(),
          SearchScreen(),
          CreatePostScreen(),
          NotificationScreen(),
          UserProfileScreen(),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.blue[400],
        child: TabBar(
          isScrollable: false,
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.search),
            ),
            Tab(
              icon: Icon(Icons.add),
            ),
            Tab(
              icon: Icon(Icons.favorite_border),
            ),
            Tab(
              icon: Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
    );
  }
}
