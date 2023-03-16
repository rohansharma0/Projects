import 'package:flutter/material.dart';

class Post {
  final String id;
  final String imageUrl;
  final String authorId;

  Post({
    @required this.id,
    @required this.imageUrl,
    @required this.authorId,
  });
}
