import 'package:flutter/material.dart';

class Profile {
  final String id;
  final String name;
  final String imageUrl;
  final String country;
  final String city;
  final int followers;
  final int posts;
  final int followings;
  bool isFollow = false;

  Profile({
    @required this.id,
    @required this.imageUrl,
    @required this.name,
    @required this.country,
    @required this.city,
    @required this.followers,
    @required this.followings,
    @required this.posts,
    @required this.isFollow,
  });

  void toggleFollow() {
    isFollow = !isFollow;
  }

  String get getfollowers {
    if (followers >= 1000) {
      double temp = followers / 1000;
      return '${temp.toStringAsFixed(1)} k';
    } else if (followers >= 1000000) {
      double temp = followers / 1000;
      return '${temp.toStringAsFixed(1)} m';
    }
    return followers.toString();
  }

  String get getpost {
    if (followers >= 1000) {
      double temp = posts / 1000;
      return '${temp.toStringAsFixed(1)} k';
    } else if (followers >= 1000000) {
      double temp = posts / 1000000;
      return '${temp.toStringAsFixed(1)} m';
    }
    return posts.toString();
  }

  String get getfollowings {
    if (followers >= 1000) {
      double temp = followings / 1000;
      return '${temp.toStringAsFixed(1)} k';
    } else if (followers >= 1000000) {
      double temp = followings / 1000000;
      return '${temp.toStringAsFixed(1)} m';
    }
    return followings.toString();
  }
}

final List<Profile> profile = [
  Profile(
    id: 'p1',
    name: 'Lori Perez',
    imageUrl: 'assets/images/img3.jpg',
    city: 'Nantes',
    country: 'France',
    followers: 1805,
    followings: 250,
    posts: 120,
    isFollow: false,
  ),
  Profile(
    id: 'p2',
    name: 'lauren Turner',
    imageUrl: 'assets/images/img4.jpg',
    city: 'Brad Pitt',
    country: 'USA',
    followers: 56820,
    followings: 650,
    posts: 210,
    isFollow: false,
  ),
  Profile(
    id: 'p3',
    name: 'Christine Wallance',
    imageUrl: 'assets/images/img1.jpg',
    city: 'Paris',
    country: 'France',
    followers: 750,
    followings: 20,
    posts: 13,
    isFollow: false,
  ),
];
