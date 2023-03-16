import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  final String id;
  final String content;
  final String authorId;
  final Timestamp timestamp;

  Comment({
    this.id,
    this.content,
    this.authorId,
    this.timestamp,
  });

  factory Comment.fromDoc(DocumentSnapshot doc) {
    return Comment(
      id: doc.documentID,
      authorId: doc['authorId'],
      content: doc['content'],
      timestamp: doc['timestamp'],
    );
  }
}
