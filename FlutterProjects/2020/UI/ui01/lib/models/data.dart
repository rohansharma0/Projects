import 'package:ui01/models/post.dart';
import 'package:ui01/models/user.dart';

class Data {
  List<User> users = [
    User(
      id: 'a',
      name: 'Rohan Sharma',
      imageUrl: 'assets/images/profile3.jpg',
    ),
    User(
      id: 'b',
      name: 'Yash Kappor',
      imageUrl: 'assets/images/profile2.jpg',
    ),
    User(
        id: 'c',
        name: 'Shirley Sethia',
        imageUrl: 'assets/images/profile5.jpg'),
  ];

  List<Post> posts = [
    Post(
      id: 'asd',
      authorId: 'a',
      imageUrl:
          'https://images.pexels.com/photos/3575143/pexels-photo-3575143.jpeg?cs=srgb&dl=couple-eating-breakfast-on-the-bed-3575143.jpg',
    ),
    Post(
      id: 'asf',
      authorId: 'b',
      imageUrl:
          'https://images.pexels.com/photos/3449122/pexels-photo-3449122.jpeg?cs=srgb&dl=smoking-woman-3449122.jpg',
    ),
    Post(
      id: 'asgd',
      authorId: 'c',
      imageUrl:
          'https://images.pexels.com/photos/3490257/pexels-photo-3490257.jpeg?cs=srgb&dl=person-riding-brown-horse-3490257.jpg',
    ),
    Post(
      id: 'assd',
      authorId: 'a',
      imageUrl:
          'https://images.pexels.com/photos/3484702/pexels-photo-3484702.jpeg?cs=srgb&dl=man-grinding-metal-3484702.jpg',
    ),
  ];
}
