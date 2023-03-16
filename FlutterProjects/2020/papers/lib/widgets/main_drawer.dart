import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:papers/Providers/user_data.dart';
import 'package:papers/screens/main_screen.dart';
import 'package:papers/screens/settings_screen.dart';
import 'package:papers/screens/user_uploads_screen.dart';
import 'package:papers/services/auth.dart';
import 'package:papers/utilities/snakbars.dart';
import 'package:papers/utilities/styles.dart';
import 'package:papers/widgets/custom_dialog.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatefulWidget {
  MainDrawer({Key key, @required this.currentIndex}) : super(key: key);

  final int currentIndex;

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  // 0-- Explore  1---My uploads

  bool _isExploreSelected = true;
  bool _isUploadSelected = false;

  @override
  void initState() {
    super.initState();
    if (widget.currentIndex == 0) {
      if (mounted) {
        setState(() {
          _isExploreSelected = true;
          _isUploadSelected = false;
        });
      }
    } else {
      if (mounted) {
        setState(() {
          _isExploreSelected = false;
          _isUploadSelected = true;
        });
      }
    }
  }

  _buildButtons({
    String title,
    IconData icon,
    Function onbtnTap,
    bool isActive,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: (isActive) ? PapersColors.primaryColor : PapersColors.background,
        borderRadius: BorderRadius.circular(4),
      ),
      child: InkWell(
        onTap: (isActive) ? null : onbtnTap,
        child: Container(
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 22,
                color: (isActive)
                    ? PapersColors.background
                    : PapersColors.primaryColor,
              ),
              SizedBox(width: 15),
              Text(
                title,
                style: TextStyle(
                  color: (isActive)
                      ? PapersColors.background
                      : PapersColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    Future<void> _login() async {
      try {
        FirebaseUser user = await Auth.login();
        Provider.of<UserData>(context, listen: false).currentUserId = user.uid;
        Navigator.of(context).pop();

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => UserUploadsScreen(
              currentUserId: user.uid,
            ),
          ),
        );
      } catch (e) {
        print(e);
      }
    }

    _myUploads() {
      final isUserLoggedIn =
          Provider.of<UserData>(context, listen: false).isLoggedIn();
      final userId =
          Provider.of<UserData>(context, listen: false).currentUserId;
      if (isUserLoggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => UserUploadsScreen(
              currentUserId: userId,
            ),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return CustomDialog(
              context: context,
              title: 'View uploads',
              content: 'You must sign in yo view your uploads.',
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                FlatButton(
                  onPressed: _login,
                  child: Text('Sign In'),
                ),
              ],
            );
          },
        );
      }
    }

    _explore() {
      Navigator.pushReplacementNamed(context, MainScreen.routeName);
    }

    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
        final user = snapshot.data;
        Provider.of<UserData>(context).currentUserId =
            (snapshot.hasData) ? user.uid : null;

        return Drawer(
          child: Container(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: deviceSize.height * 0.2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[100],
                        backgroundImage: (user != null)
                            ? CachedNetworkImageProvider(
                                user.photoUrl,
                              )
                            : AssetImage('assets/images/user_placeholder.jpg'),
                      ),
                      SizedBox(height: 20),
                      Text(
                        (user != null) ? user.displayName : ' Papers',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        (user != null) ? user.email : '',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      _buildButtons(
                        title: 'Explore',
                        icon: PapersIcons.home,
                        onbtnTap: _explore,
                        isActive: _isExploreSelected,
                      ),
                      _buildButtons(
                        title: 'My Uploads',
                        icon: PapersIcons.cloud_upload,
                        onbtnTap: _myUploads,
                        isActive: _isUploadSelected,
                      ),
                      Divider(),
                      _buildButtons(
                        title: 'Settings',
                        icon: PapersIcons.slider,
                        onbtnTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => SettingsScreen(),
                          ));
                        },
                        isActive: false,
                      ),
                      _buildButtons(
                        title: 'Rate',
                        icon: PapersIcons.star_border,
                        onbtnTap: () =>
                            Snackbar.showFeatureNotPresentSnakbar(context),
                        isActive: false,
                      ),
                      _buildButtons(
                        title: 'Help & feedback',
                        icon: Icons.help_outline,
                        onbtnTap: () =>
                            Snackbar.showFeatureNotPresentSnakbar(context),
                        isActive: false,
                      ),
                      (user != null)
                          ? _buildButtons(
                              title: 'Sign Out',
                              icon: Icons.exit_to_app,
                              onbtnTap: () async {
                                if (widget.currentIndex != 1) {
                                  await Auth.logout();
                                  Navigator.pop(context);
                                } else {
                                  _explore();
                                  Auth.logout();
                                }
                              },
                              isActive: false,
                            )
                          : _buildButtons(
                              title: 'Sign In',
                              icon: PapersIcons.user,
                              onbtnTap: () async {
                                await Auth.login();
                                Navigator.of(context).pop();
                              },
                              isActive: false,
                            ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  color: PapersColors.tertiary,
                  child: InkWell(
                    onTap: () => Snackbar.showFeatureNotPresentSnakbar(context),
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.priority_high,
                            size: 22,
                            color: PapersColors.background,
                          ),
                          SizedBox(width: 15),
                          Text(
                            'GO PRO',
                            style: TextStyle(
                              color: PapersColors.background,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
