import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 2,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.black));
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'ig_rohan',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 1,
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
              color: Colors.black,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate((ctx, inr) {
                return Card(
                  child: Text('sfsf'),
                );
              }),
            )
          ],
        ));
  }
}

// class Header implements SliverPersistentHeaderDelegate {

// }
// SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Row(
//                     children: <Widget>[
//                       CircleAvatar(
//                         radius: 40,
//                         backgroundImage: NetworkImage(
//                             'https://cdn.pixabay.com/photo/2016/10/09/18/03/smile-1726471_960_720.jpg'),
//                       ),
//                       SizedBox(width: 10),
//                       Expanded(
//                         child: Column(
//                           children: <Widget>[
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: <Widget>[
//                                 Column(
//                                   children: <Widget>[
//                                     Text(
//                                       '12',
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     Text('Posts'),
//                                   ],
//                                 ),
//                                 Column(
//                                   children: <Widget>[
//                                     Text(
//                                       '805',
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     Text('Followers'),
//                                   ],
//                                 ),
//                                 Column(
//                                   children: <Widget>[
//                                     Text(
//                                       '122',
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     Text('Followings'),
//                                   ],
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     'R O H A N',
//                     style: TextStyle(fontWeight: FontWeight.w700),
//                   ),
//                   SizedBox(height: 20),
//                   InkWell(
//                     onTap: () {},
//                     child: Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           width: 1.0,
//                           style: BorderStyle.solid,
//                           color: Colors.black26,
//                         ),
//                         borderRadius: BorderRadius.circular(4),
//                       ),
//                       alignment: Alignment.center,
//                       height: 30,
//                       width: double.infinity,
//                       child: Text(
//                         'Edit Profile',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border(
//                   top: BorderSide(width: 0.5, color: Colors.black12),
//                   bottom: BorderSide(width: 0.5, color: Colors.black12),
//                 ),
//               ),
//               child: TabBar(
//                 controller: _tabController,
//                 indicatorColor: Colors.black,
//                 indicatorWeight: 1,
//                 isScrollable: false,
//                 indicatorPadding: EdgeInsets.all(0),
//                 tabs: <Widget>[
//                   Tab(
//                     icon: Icon(
//                       Icons.apps,
//                       color: Colors.black45,
//                     ),
//                   ),
//                   Tab(
//                     icon: Icon(
//                       Icons.assignment_ind,
//                       color: Colors.black45,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
