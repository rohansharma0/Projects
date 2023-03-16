import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:papers_admin/models/paper.dart';
import 'package:papers_admin/widgets/paper_item.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    Key key,
    @required this.papers,
  }) : super(key: key);

  final List<Paper> papers;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      // reverse: true,
      crossAxisCount: 4,
      staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
      mainAxisSpacing: 2.0,
      crossAxisSpacing: 2.0,
      addAutomaticKeepAlives: true,
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
