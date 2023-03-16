import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:papers_admin/models/paper.dart';
import 'package:papers_admin/models/user.dart';

class PaperDetails extends StatelessWidget {
  final Paper paper;
  final User user;
  const PaperDetails({
    Key key,
    @required this.paper,
    @required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey[100],
                      backgroundImage: (user != null)
                          ? CachedNetworkImageProvider(
                              user.profileImageUrl,
                            )
                          : AssetImage('assets/images/user_placeholder.jpg'),
                    ),
                    Text((user != null) ? user.name : ''),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {},
              )
            ],
          ),
          Row(
            children: <Widget>[
              Text('Category :'),
              Text('Size :'),
            ],
          )
        ],
      ),
    );
  }
}
