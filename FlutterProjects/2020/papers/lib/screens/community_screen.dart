import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:papers/Providers/user_data.dart';
import 'package:papers/models/paper.dart';
import 'package:papers/screens/add_papers_screen.dart';
import 'package:papers/services/auth.dart';
import 'package:papers/services/database.dart';
import 'package:papers/widgets/custom_dialog.dart';
import 'package:papers/widgets/custom_grid_view.dart';
import 'package:provider/provider.dart';

class CommunityScreen extends StatefulWidget {
  CommunityScreen({Key key}) : super(key: key);

  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  List<Paper> _papers = [];

  @override
  void initState() {
    super.initState();
    _setupPapers();
  }

  _setupPapers() async {
    List<Paper> papers = await Database.getCommunityPapers();
    if (mounted) {
      setState(() {
        _papers = papers;
      });
    }
  }

  _showUploadsTerms() {
    final userId = Provider.of<UserData>(context, listen: false).currentUserId;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          context: context,
          title: 'Let\'s Get Social',
          content:
              'When you press the upload button, you agree that anything you upload does not contain any prohibited content, as stated in our Terms of Use.',
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AddPapaersScreen(
                      currentUserId: userId,
                    ),
                  ),
                );
              },
              child: Text('Agree'),
            ),
          ],
        );
      },
    );
  }

  _uploadPaper() {
    final isUserLoggedIn =
        Provider.of<UserData>(context, listen: false).isLoggedIn();

    if (isUserLoggedIn) {
      _showUploadsTerms();
    } else {
      showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return CustomDialog(
            context: context,
            title: 'Let\'s Get Social',
            content:
                'Want to upload some of your content?\nSign in to get started.',
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

  Future<void> _login() async {
    try {
      FirebaseUser user = await Auth.login();
      Provider.of<UserData>(context, listen: false).currentUserId = user.uid;
      Navigator.of(context).pop();

      _showUploadsTerms();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => _setupPapers(),
        child: Container(
          padding: EdgeInsets.all(2),
          child: CustomGridView(papers: _papers),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _uploadPaper,
        child: Icon(Icons.arrow_upward),
      ),
    );
  }
}
