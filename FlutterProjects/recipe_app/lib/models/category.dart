import 'package:flutter/material.dart';

class Category {
  final String id;
  final String imageUrl;
  final String name;

  const Category({
    @required this.id,
    @required this.imageUrl,
    @required this.name,
  });
}

const Dummy_Categries = const [
  Category(
    id: 'c1',
    name: 'Soups',
    imageUrl: 'assets/images/cat-1.jpg',
  ),
  Category(
    id: 'c1',
    name: 'Desserts',
    imageUrl: 'assets/images/cat-2.jpg',
  ),
  Category(
    id: 'c1',
    name: 'Lunch',
    imageUrl: 'assets/images/cat-1.jpg',
  ),
  Category(
    id: 'c1',
    name: 'Dinner',
    imageUrl: 'assets/images/cat-2.jpg',
  ),
];
