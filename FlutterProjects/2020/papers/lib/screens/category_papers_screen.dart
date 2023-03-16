import 'package:flutter/material.dart';
import 'package:papers/models/category.dart';
import 'package:papers/models/paper.dart';
import 'package:papers/services/database.dart';
import 'package:papers/widgets/custom_grid_view.dart';

class CategoryPapersScreen extends StatefulWidget {
  final Category category;
  CategoryPapersScreen({Key key, @required this.category}) : super(key: key);

  @override
  _CategoryPapersScreenState createState() => _CategoryPapersScreenState();
}

class _CategoryPapersScreenState extends State<CategoryPapersScreen> {
  List<Paper> _papers = [];

  @override
  void initState() {
    super.initState();
    _setupPapers();
  }

  _setupPapers() async {
    List<Paper> papers =
        await Database.getPapersByCategory(widget.category.title);
    if (mounted) {
      setState(() {
        _papers = papers;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category.title,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
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
