import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:papers/models/paper.dart';
import 'package:papers/models/user.dart';
import 'package:papers/utilities/snakbars.dart';
import 'package:papers/utilities/styles.dart';

class PaperDetails extends StatefulWidget {
  final Paper paper;
  final User user;
  const PaperDetails({
    Key key,
    @required this.paper,
    @required this.user,
  }) : super(key: key);

  @override
  _PaperDetailsState createState() => _PaperDetailsState();
}

class _PaperDetailsState extends State<PaperDetails> {
  @override
  Widget build(BuildContext context) {
    bool _isLiked = false;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey[100],
                      backgroundImage: (widget.user != null)
                          ? CachedNetworkImageProvider(
                              widget.user.profileImageUrl,
                            )
                          : AssetImage('assets/images/user_placeholder.jpg'),
                    ),
                    SizedBox(width: 15),
                    Text((widget.user != null) ? widget.user.name : ''),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  (_isLiked) ? PapersIcons.heart : PapersIcons.heart_border,
                  color: (_isLiked)
                      ? PapersColors.tertiary
                      : PapersColors.primaryColor,
                  size: 30,
                ),
                onPressed: () => Snackbar.showFeatureNotPresentSnakbar(context),
              )
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                  'Size : ${(widget.paper.imageSize / 1000000).toStringAsFixed(2)} MB'),
              Text(
                  'Res ${widget.paper.imageResolution[0]}x${widget.paper.imageResolution[1]}'),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Category : ${widget.paper.category}'),
              Text('Size 4.2 mb'),
            ],
          )
        ],
      ),
    );
  }
}
