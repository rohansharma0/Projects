import 'package:cloud_firestore/cloud_firestore.dart';

class Paper {
  final String id;
  final String imageUrl;
  final String thumbnailImageUrl;
  final String category;
  final String authorId;
  final Timestamp timestamp;
  final int imageSize;
  final List<dynamic> imageResolution;

  Paper({
    this.id,
    this.imageUrl,
    this.thumbnailImageUrl,
    this.category,
    this.authorId,
    this.timestamp,
    this.imageResolution,
    this.imageSize,
  });

  factory Paper.fromDoc(DocumentSnapshot doc) {
    return Paper(
      id: doc.documentID,
      imageUrl: doc['imageUrl'],
      thumbnailImageUrl: doc['thumbnailImageUrl'],
      category: doc['category'],
      authorId: doc['authorId'],
      timestamp: doc['timestamp'],
      imageSize: doc['imageSize'],
      imageResolution: doc['imageResolution'],
    );
  }
}
