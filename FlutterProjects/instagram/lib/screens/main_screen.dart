import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/providers/user_data.dart';
import 'package:instagram/screens/home_screens/create_post_screen.dart';
import 'package:instagram/screens/home_screens/feed_screen.dart';
import 'package:instagram/screens/home_screens/message_screen.dart';
import 'package:instagram/screens/home_screens/notification_screen.dart';
import 'package:instagram/screens/home_screens/search_screen.dart';
import 'package:instagram/screens/home_screens/story_screen.dart';
import 'package:instagram/screens/home_screens/user_profile_screen.dart';
import 'package:provider/provider.dart';

// class MainScreen extends StatefulWidget {
//   static const routeName = 'home/';

//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   PageController _pageController;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: 1);
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PageView(
//       controller: _pageController,
//       children: <Widget>[
//         StoryScreen(),
//         HomeScreen(),
//         MessageScreen(),
//       ],
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  static const routeName = 'home/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String currentUserId = Provider.of<UserData>(context).currentUserId;
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[
          FeedScreen(currentUserId),
          SearchScreen(),
          CreatePostScreen(),
          NotificationScreen(currentUserId: currentUserId),
          UserProfileScreen(
            currentUserId: currentUserId,
            userId: currentUserId,
          ),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 2) {
            Navigator.of(context).pushNamed(CreatePostScreen.routeName);
          } else {
            setState(() {
              _currentIndex = index;
            });
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 200),
              curve: Curves.easeIn,
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
          ),
        ],
      ),
    );
  }
}
