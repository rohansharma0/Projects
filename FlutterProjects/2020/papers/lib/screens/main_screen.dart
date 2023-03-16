import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:papers/screens/category_screen.dart';
import 'package:papers/screens/community_screen.dart';
import 'package:papers/screens/favourite_screen.dart';
import 'package:papers/screens/home_screen.dart';
import 'package:papers/utilities/snakbars.dart';
import 'package:papers/utilities/styles.dart';
import 'package:papers/widgets/appbar.dart';
import 'package:papers/widgets/main_drawer.dart';

class MainScreen extends StatefulWidget {
  static const routeName = 'home';
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 1;
  PageController _pageController;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 1,
    );
    _tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: 1,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  String _setAppbarTitle(int i) {
    if (i == 0) {
      return 'COMMUNITY';
    } else if (i == 1) {
      return 'EXPLORE';
    } else if (i == 2) {
      return 'COLLECTIONS';
    } else {
      return 'FAVOURITES';
    }
  }

  List<Widget> _setAppbarIcon(int i, BuildContext context) {
    if (i == 1) {
      return [
        IconButton(
          onPressed: () => Snackbar.showFeatureNotPresentSnakbar(context),
          icon: Icon(PapersIcons.search),
        )
      ];
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CustomAppBar(
          title: _setAppbarTitle(_currentIndex),
          actionIcons: _setAppbarIcon(_currentIndex, context),
        ),
      ),
      drawer: MainDrawer(
        currentIndex: 0,
      ),
      body: PageView(
        physics: ClampingScrollPhysics(),
        onPageChanged: (i) {
          setState(() {
            _currentIndex = i;
            _tabController.index = i;
          });
        },
        controller: _pageController,
        children: <Widget>[
          CommunityScreen(),
          HomeScreen(),
          CategoryScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        child: TabBar(
          controller: _tabController,
          unselectedLabelColor: PapersColors.secondary,
          indicatorColor: Colors.transparent,
          labelColor: PapersColors.primaryColor,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            _tabController.index = index;
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 200),
              curve: Curves.easeIn,
            );
          },
          tabs: <Widget>[
            Tab(
              icon: Icon(PapersIcons.community),
            ),
            Tab(
              icon: Icon(PapersIcons.home),
            ),
            Tab(
              icon: Icon(PapersIcons.category),
            ),
            Tab(
              icon: Icon(PapersIcons.heart),
            ),
          ],
        ),
      ),
    );
  }
}
