import 'package:flutter/material.dart';
import 'package:instagram/models/post.dart';
import 'package:instagram/models/user.dart';
import 'package:instagram/providers/database.dart';
import 'package:instagram/widgets/post_view.dart';

class PostScreen extends StatefulWidget {
  final String currentUserId;
  final String userId;
  PostScreen({Key key, this.currentUserId, this.userId}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Post> _posts = [];
  @override
  void initState() {
    _setupPosts();
    super.initState();
  }

  _setupPosts() async {
    List<Post> posts = await Database.getUserPosts(widget.userId);
    setState(() {
      _posts = posts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Posts',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () => _setupPosts(),
        child: ListView.builder(
          itemCount: _posts.length,
          itemBuilder: (BuildContext context, int index) {
            Post post = _posts[index];
            return FutureBuilder(
              future: Database.getUserWithId(widget.userId),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return SizedBox.shrink();
                }
                User author = snapshot.data;
                return PostView(
                  currentUserId: widget.currentUserId,
                  post: post,
                  author: author,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
// List<PostView> postViews = [];
//       _posts.forEach((post) async {
//         postViews.add(
//           PostView(
//             currentUserId: widget.currentUserId,
//             post: post,
//             author: _profileUser,
//           ),
//         );
//       });
//       return Column(children: postViews);
