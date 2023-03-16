import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  final String id;
  final String title;
  final String backgroundImageUrl;

  Category({
    @required this.id,
    @required this.title,
    @required this.backgroundImageUrl,
  });

  factory Category.fromDoc(DocumentSnapshot doc) {
    return Category(
      id: doc.documentID,
      title: doc['title'],
      backgroundImageUrl: doc['backgroundImageUrl'],
    );
  }
}
