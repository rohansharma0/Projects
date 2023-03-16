import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:papers/models/paper.dart';
import 'package:papers/screens/paper_screen.dart';

class PaperItem extends StatefulWidget {
  final Paper paper;
  PaperItem({Key key, @required this.paper}) : super(key: key);

  @override
  _PaperItemState createState() => _PaperItemState();
}

class _PaperItemState extends State<PaperItem> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.paper.id,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PaperScreen(
                paper: widget.paper,
              ),
            ),
          );
        },
        child: Image(
          image: CachedNetworkImageProvider(widget.paper.thumbnailImageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
