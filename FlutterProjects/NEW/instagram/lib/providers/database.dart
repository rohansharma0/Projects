import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram/models/post.dart';
import 'package:instagram/models/user.dart';
import 'package:instagram/utilities/constants.dart';

class Database {
  static Future<void> updateUser(User user) async {
    try {
      await userRef.document(user.id).updateData({
        'name': user.name,
        'profileImageUrl': user.profileImageUrl,
        'username': user.username,
        'email': user.email,
        'bio': user.bio,
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<QuerySnapshot> searchUsers(String name) {
    Future<QuerySnapshot> users = userRef
        .where(
          'name',
          isGreaterThanOrEqualTo: name,
        )
        .getDocuments();
    return users;
  }

  static Future<void> createPost(Post post) async {
    try {
      await postRef.document(post.authorId).collection('usersPosts').add({
        'imageUrl': post.imageUrl,
        'caption': post.caption,
        'likes': post.likes,
        'authorId': post.authorId,
        'timestamp': post.timestamp,
      });
    } catch (e) {
      print(e);
    }
  }

  static void followUser({String currentUserId, String userId}) async {
    // Add user to current user's following collecton
    followingsRef
        .document(currentUserId)
        .collection('userFollowings')
        .document(userId)
        .setData({});
    // Add current user to user's followers collection
    followersRef
        .document(userId)
        .collection('userFollowers')
        .document(currentUserId)
        .setData({});
  }

  static void unfollowUser({String currentUserId, String userId}) async {
    followingsRef
        .document(currentUserId)
        .collection('userFollowings')
        .document(userId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    // remove current user from user's followers collection
    followersRef
        .document(userId)
        .collection('userFollowers')
        .document(currentUserId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
  }

  static Future<bool> isFollowingUser(
      String currentUserId, String userId) async {
    DocumentSnapshot followingDoc = await followersRef
        .document(userId)
        .collection('userFollowers')
        .document(currentUserId)
        .get();
    return followingDoc.exists;
  }

  static Future<int> numFollowers(String userId) async {
    QuerySnapshot followerSnapshot = await followersRef
        .document(userId)
        .collection('userFollowers')
        .getDocuments();
    return followerSnapshot.documents.length;
  }

  static Future<int> numFollowings(String userId) async {
    QuerySnapshot followingSnapshot = await followingsRef
        .document(userId)
        .collection('userFollowings')
        .getDocuments();
    return followingSnapshot.documents.length;
  }
}
