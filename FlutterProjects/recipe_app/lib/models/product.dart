import 'package:flutter/widgets.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  // final Map<String,double> ingredient;

  const Product({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.imageUrl,
  });
}

const Dummy_Products = const [
  Product(
    id: 'p1',
    name: 'Pesto Turkey Burgers',
    description:
        'This is an awesome turkey burger with garlic, pesto, feta cheese, and seasoned salt. Even my husband liked it and he typically will only eat traditional burgers!',
    imageUrl: 'assets/images/p3.jpg',
  ),
  Product(
    id: 'p1',
    name: 'Pesto Turkey Burgers',
    description:
        'This is an awesome turkey burger with garlic, pesto, feta cheese, and seasoned salt. Even my husband liked it and he typically will only eat traditional burgers!',
    imageUrl: 'assets/images/p1.jpg',
  ),
  Product(
    id: 'p1',
    name: 'Pesto Turkey Burgers',
    description:
        'This is an awesome turkey burger with garlic, pesto, feta cheese, and seasoned salt. Even my husband liked it and he typically will only eat traditional burgers!',
    imageUrl: 'assets/images/p2.jpg',
  ),
];
