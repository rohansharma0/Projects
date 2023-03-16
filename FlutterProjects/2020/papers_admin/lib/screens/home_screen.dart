import 'package:flutter/material.dart';
import 'package:papers_admin/Providers/user_data.dart';
import 'package:papers_admin/models/paper.dart';
import 'package:papers_admin/screens/add_papers_screen.dart';
import 'package:papers_admin/services/auth.dart';
import 'package:papers_admin/services/database.dart';
import 'package:papers_admin/widgets/custom_grid_view.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home';

  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Paper> _papers = [];

  @override
  void initState() {
    super.initState();
    _setupPapers();
  }

  _setupPapers() async {
    List<Paper> papers = await Database.getExplorePapers();
    setState(() {
      _papers = papers;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userId = Provider.of<UserData>(context).currentUserId;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'EXPLORE',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              await Auth.logout();
            },
            icon: Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _setupPapers(),
        child: Container(
          padding: EdgeInsets.all(2),
          child: CustomGridView(papers: _papers),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AddPapaersScreen(
                currentUserId: userId,
              ),
            ),
          );
        },
        child: Icon(Icons.file_upload),
      ),
    );
  }
}
