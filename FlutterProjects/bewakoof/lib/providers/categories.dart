import 'package:flutter/material.dart';
import '../models/category.dart';

class Categories with ChangeNotifier {
  List<Category> _categories = [
    Category(
      id: 'male',
      title: 'Male',
    ),
    Category(
      id: 'female',
      title: 'Female',
    ),
    Category(
      id: 'half-sleeve',
      title: 'Half Sleeve',
    ),
    Category(
      id: 'full-sleeve',
      title: 'Full Sleeve',
    ),
    Category(
      id: 'shirt',
      title: 'Shirts',
    ),
    Category(
      id: 'wishlist',
      title: 'Wishlist',
    ),
  ];

  List<Category> get items {
    return [..._categories];
  }

  Category findById(String id) {
    return _categories.firstWhere((cat) => cat.id == id);
  }
}
