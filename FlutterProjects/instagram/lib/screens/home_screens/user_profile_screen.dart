import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram/models/post.dart';
import 'package:instagram/models/user.dart';
import 'package:instagram/providers/database.dart';
import 'package:instagram/providers/user_data.dart';
import 'package:instagram/screens/home_screens/edit_profile_screen.dart';
import 'package:instagram/screens/home_screens/post_screen.dart';
import 'package:instagram/utilities/constants.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatefulWidget {
  static const routeName = 'user-profile/';
  final String currentUserId;
  final String userId;

  UserProfileScreen({this.currentUserId, this.userId});
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  bool _isFollowing = false;
  int _followerCount = 0;
  int _followingCount = 0;
  List<Post> _posts = [];
  int _displayPosts = 0; // 0--grid , 1 --column
  User _profileUser;

  @override
  void initState() {
    super.initState();

    _setupIsFollowing();
    _setupFollowings();
    _setupFollowers();
    _setupPosts();
    _setupProfileUser();
  }

  _setupIsFollowing() async {
    bool isFollowingUser =
        await Database.isFollowingUser(widget.currentUserId, widget.userId);
    setState(() {
      _isFollowing = isFollowingUser;
    });
  }

  _setupFollowers() async {
    int userFollowerCount = await Database.numFollowers(widget.userId);
    setState(() {
      _followerCount = userFollowerCount;
    });
  }

  _setupFollowings() async {
    int userFollowingCount = await Database.numFollowings(widget.userId);
    setState(() {
      _followingCount = userFollowingCount;
    });
  }

  _setupPosts() async {
    List<Post> posts = await Database.getUserPosts(widget.userId);
    setState(() {
      _posts = posts;
    });
  }

  _setupProfileUser() async {
    User profileUser = await Database.getUserWithId(widget.userId);
    setState(() {
      _profileUser = profileUser;
    });
  }

  _followOrUnfollow() {
    if (_isFollowing) {
      _unfollowUser();
    } else {
      _followUser();
    }
  }

  _unfollowUser() {
    Database.unfollowUser(
      currentUserId: widget.currentUserId,
      userId: widget.userId,
    );
    setState(() {
      _isFollowing = false;
      _followerCount--;
    });
  }

  _followUser() {
    Database.followUser(
      currentUserId: widget.currentUserId,
      userId: widget.userId,
    );
    setState(() {
      _isFollowing = true;
      _followerCount++;
    });
  }

  _displayButton(User user) {
    return user.id != Provider.of<UserData>(context).currentUserId
        ? InkWell(
            borderRadius: BorderRadius.circular(5),
            splashColor: Colors.transparent,
            onTap: _followOrUnfollow,
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 0.5,
                  color: _isFollowing ? Colors.grey : Colors.blue,
                ),
                color: _isFollowing ? Colors.white : Colors.blue,
              ),
              alignment: Alignment.center,
              child: Text(
                _isFollowing ? 'Unfollow' : 'Follow',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _isFollowing ? Colors.black : Colors.white),
              ),
            ),
          )
        : Center(
            child: InkWell(
              borderRadius: BorderRadius.circular(5),
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => EditProfileScreen(
                      user: user,
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 0.5,
                    color: Colors.grey,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Edit Profile',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
  }

  _buildProfileInfo(User user) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 40,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      color: Colors.grey[300],
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                backgroundColor: Colors.grey,
                backgroundImage: user.profileImageUrl.isEmpty
                    ? AssetImage('assets/images/user_placeholder.jpg')
                    : CachedNetworkImageProvider(user.profileImageUrl),
              ),
              SizedBox(width: 40),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          _posts.length.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text('Posts'),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          _followerCount.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text('Followers'),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          _followingCount.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text('Followings'),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            user.bio,
          ),
          SizedBox(height: 10),
          _displayButton(user),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  _buildToggleButtons() {
    return DefaultTabController(
      length: 2,
      child: TabBar(
        indicatorColor: Colors.black,
        indicatorWeight: 1,
        labelColor: Colors.black,
        onTap: (int index) {
          setState(() {
            _displayPosts = index;
          });
        },
        unselectedLabelColor: Colors.grey,
        tabs: <Widget>[
          Tab(
            icon: Icon(
              Icons.grid_on,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.tag_faces,
            ),
          ),
        ],
      ),
    );
  }

  _buildTilePost(Post post) {
    return GridTile(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PostScreen(
                currentUserId: widget.currentUserId,
                userId: widget.userId,
              ),
            ),
          );
        },
        child: Image(
          image: CachedNetworkImageProvider(
            post.imageUrl,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _buildDisplayPost() {
    if (_displayPosts == 0) {
      //Grid
      List<GridTile> titles = [];
      _posts.forEach(
        (post) => titles.add(_buildTilePost(post)),
      );
      return GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        mainAxisSpacing: 2.0,
        crossAxisSpacing: 2.0,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: titles,
      );
    } else {
      // tag View
      // List<PostView> postViews = [];
      // _posts.forEach((post) async {
      //   postViews.add(
      //     PostView(
      //       currentUserId: widget.currentUserId,
      //       post: post,
      //       author: _profileUser,
      //     ),
      //   );
      // });
      // return Column(children: postViews);
      return Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text('Tag Feature Comming soon!!'),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: FutureBuilder(
        future: userRef.document(widget.userId).get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          User user = User.fromDoc(snapshot.data);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                user.username,
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              actionsIconTheme: IconThemeData(
                color: Colors.black,
              ),
              actions: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu),
                )
              ],
            ),
            backgroundColor: Colors.white,
            body: RefreshIndicator(
              onRefresh: () => _setupPosts(),
              child: ListView(
                children: <Widget>[
                  _buildProfileInfo(user),
                  Divider(),
                  _buildToggleButtons(),
                  SizedBox(height: 2),
                  _buildDisplayPost(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
