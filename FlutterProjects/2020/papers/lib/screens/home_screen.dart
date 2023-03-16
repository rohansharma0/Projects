import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:papers/models/paper.dart';
import 'package:papers/services/database.dart';
import 'package:papers/widgets/custom_grid_view.dart';

class HomeScreen extends StatefulWidget {
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
    if (mounted) {
      setState(() {
        _papers = papers;
      });
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
    );
  }
}
