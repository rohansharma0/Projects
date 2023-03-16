import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:papers/models/category.dart';
import 'package:papers/models/paper.dart';
import 'package:papers/models/user.dart';
import 'package:papers/utilities/constants.dart';

class Database {
  // get all categories as stream

  static List<Category> _categoriesFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Category(
        id: doc.documentID,
        title: doc.data['title'],
        backgroundImageUrl: doc.data['backgroundImageUrl'],
      );
    }).toList();
  }

  static Stream<List<Category>> get getCategories {
    return categoriesRef.snapshots().map(_categoriesFromSnapshot);
  }

  static Future<List<String>> getCategoriesTitleList() async {
    QuerySnapshot categoriesSnapshot = await categoriesRef.getDocuments();

    List<String> categoriesTitle = categoriesSnapshot.documents
        .map((doc) => doc.data['title'].toString())
        .toList();

    return categoriesTitle;
  }

  static Future<String> gerCategoryId(String categoryTitle) async {
    QuerySnapshot categoriesSnapshot = await categoriesRef.getDocuments();

    String categoryId = categoriesSnapshot.documents
        .firstWhere((doc) => doc.data['title'] == categoryTitle)
        .documentID;
    return categoryId;
  }

  // create community Paper

  static Future<void> createCommunityPaper(Paper paper) async {
    try {
      await communityPapersRef.document(paper.id).setData({
        'id': paper.id,
        'imageUrl': paper.imageUrl,
        'thumbnailImageUrl': paper.thumbnailImageUrl,
        'category': paper.category,
        'authorId': paper.authorId,
        'imageSize': paper.imageSize,
        'imageResolution': paper.imageResolution,
        'timestamp': paper.timestamp,
      });
    } catch (e) {
      print(e);
    }
  }

  // get all community papers data

  static Future<List<Paper>> getCommunityPapers() async {
    QuerySnapshot papersSnapshot = await communityPapersRef
        .orderBy('timestamp', descending: true)
        .getDocuments();

    List<Paper> papers = papersSnapshot.documents.map((doc) {
      return Paper(
        id: doc.documentID,
        authorId: doc.data['authorId'],
        category: doc.data['category'],
        imageUrl: doc.data['imageUrl'],
        imageResolution: doc.data['imageResolution'],
        imageSize: doc.data['imageSize'],
        thumbnailImageUrl: doc.data['thumbnailImageUrl'],
        timestamp: doc.data['timestamp'],
      );
    }).toList();

    return papers;
  }

  // create Explore Paper

  static Future<void> createExplorePaper(Paper paper) async {
    try {
      await communityPapersRef.document(paper.id).setData({
        'id': paper.id,
        'imageUrl': paper.imageUrl,
        'thumbnailImageUrl': paper.thumbnailImageUrl,
        'category': paper.category,
        'authorId': paper.authorId,
        'imageSize': paper.imageSize,
        'imageResolution': paper.imageResolution,
        'timestamp': paper.timestamp,
      });
    } catch (e) {
      print(e);
    }
  }

  // get all explore papers data

  static Future<List<Paper>> getExplorePapers() async {
    QuerySnapshot papersSnapshot =
        await papersRef.orderBy('timestamp', descending: true).getDocuments();

    List<Paper> papers = papersSnapshot.documents.map((doc) {
      return Paper(
        id: doc.documentID,
        authorId: doc.data['authorId'],
        category: doc.data['category'],
        imageUrl: doc.data['imageUrl'],
        imageResolution: doc.data['imageResolution'],
        imageSize: doc.data['imageSize'],
        thumbnailImageUrl: doc.data['thumbnailImageUrl'],
        timestamp: doc.data['timestamp'],
      );
    }).toList();

    return papers;
  }

  // get all users uploaded  papers

  static Future<List<Paper>> getUserUploads({String currentUserId}) async {
    QuerySnapshot userUploads = await communityPapersRef
        .orderBy('timestamp', descending: true)
        .getDocuments();

    List<Paper> papers = userUploads.documents
        .where((paper) => paper.data['authorId'] == currentUserId)
        .map((doc) {
      return Paper(
        id: doc.documentID,
        authorId: doc.data['authorId'],
        category: doc.data['category'],
        imageUrl: doc.data['imageUrl'],
        imageResolution: doc.data['imageResolution'],
        imageSize: doc.data['imageSize'],
        thumbnailImageUrl: doc.data['thumbnailImageUrl'],
        timestamp: doc.data['timestamp'],
      );
    }).toList();
    return papers;
  }

  // get FirebaseUser by a given id
  static Future<User> getUserWithId(String paperAuthorId) async {
    DocumentSnapshot userDocSnapshot =
        await userRef.document(paperAuthorId).get();
    if (userDocSnapshot.exists) {
      return User.fromDoc(userDocSnapshot);
    } else {
      return User();
    }
  }

  // get papers by category

  static Future<List<Paper>> getPapersByCategory(String categoryTitle) async {
    QuerySnapshot categoryPapers =
        await papersRef.orderBy('timestamp', descending: true).getDocuments();

    List<Paper> papers = categoryPapers.documents
        .where((paper) => paper.data['category'] == categoryTitle)
        .map((doc) {
      return Paper(
        id: doc.documentID,
        authorId: doc.data['authorId'],
        category: doc.data['category'],
        imageUrl: doc.data['imageUrl'],
        imageResolution: doc.data['imageResolution'],
        imageSize: doc.data['imageSize'],
        thumbnailImageUrl: doc.data['thumbnailImageUrl'],
        timestamp: doc.data['timestamp'],
      );
    }).toList();
    return papers;
  }
  // likes Unlikes--papers

  static Future<void> likePapers({String currentUserId, Paper paper}) async {
    try {
      await likesRef
          .document(paper.id)
          .collection('paperLikes')
          .document(currentUserId)
          .setData({});
    } catch (e) {
      print(e);
    }
  }

  static Future<void> unlikePapers({String currentUserId, Paper paper}) async {
    try {
      await likesRef
          .document(paper.id)
          .collection('paperLikes')
          .document(currentUserId)
          .delete();
    } catch (e) {
      print(e);
    }
  }

  static Future<bool> didLikePaper({String currentuserId, Paper paper}) async {
    DocumentSnapshot userDoc = await likesRef
        .document(paper.id)
        .collection('paperLikes')
        .document(currentuserId)
        .get();
    return userDoc.exists;
  }
}
