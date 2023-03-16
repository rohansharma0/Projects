import 'package:flutter/material.dart';
import 'package:papers/models/paper.dart';
import 'package:papers/widgets/paper_item.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    Key key,
    @required this.papers,
  }) : super(key: key);

  final List<Paper> papers;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 2.0,
        crossAxisSpacing: 2.0,
        childAspectRatio: 4 / 5,
      ),
      itemBuilder: (BuildContext context, int index) {
        Paper paper = papers[index];
        return PaperItem(
          paper: paper,
        );
      },
      itemCount: papers.length,
    );
  }
}
