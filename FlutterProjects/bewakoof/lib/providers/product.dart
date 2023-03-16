import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/http_exception.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  // final String description;
  final double price;
  final double oldPrice;
  final String imageUrl;
  bool isFavorite;
  final String gender;
  final String category;

  Product({
    @required this.id,
    @required this.title,
    // @required this.description,
    @required this.price,
    @required this.oldPrice,
    @required this.imageUrl,
    @required this.gender,
    @required this.category,
    this.isFavorite = false,
  });

  Future<void> toggleFavoriteStatus(String token, String userId) async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url =
        'https://bewakoof-d4c2f.firebaseio.com/userFavorite/$userId/$id.json?auth=$token';
    try {
      final response = await http.put(
        url,
        body: json.encode(
          isFavorite,
        ),
      );
      if (response.statusCode >= 400) {
        isFavorite = oldStatus;
        notifyListeners();
      }
    } catch (error) {
      isFavorite = oldStatus;
      notifyListeners();
    }
  }
}

class Products with ChangeNotifier {
  List<Product> _items = [
    // Product(
    //   id: 'p1',
    //   title: 'The Night Batman Half Sleeve T-Shirt (BML)',
    //   // description: ,
    //   price: 259.00,
    //   oldPrice: 499.00,
    //   imageUrl:
    //       'https://images.bewakoof.com/original/the-night-batman-half-sleeve-t-shirt-bml-men-s-printed-t-shirts-231380-1566892415.jpg?tr=q-100',
    //   gender: 'male',
    //   category: 'half-sleeve',
    // ),
    // Product(
    //   id: 'p2',
    //   title: 'Feel The Burn Half Sleeve T-Shirt',
    //   // description: ,
    //   price: 259.00,
    //   oldPrice: 499.00,
    //   imageUrl:
    //       'https://images.bewakoof.com/original/feel-the-burn-half-sleeve-t-shirt-men-s-printed-t-shirts-228722-1566024999.jpg?tr=q-100',
    //   gender: 'male',
    //   category: 'half-sleeve',
    // ),
    // Product(
    //   id: 'p3',
    //   title: 'Doe Bolt Half Sleeve T-Shirt',
    //   // description: ,
    //   oldPrice: 499.00,
    //   price: 299.00,
    //   imageUrl:
    //       'https://images.bewakoof.com/original/doe-bolt-half-sleeve-t-shirt-men-s-printed-t-shirts-218319-1559648820.jpg?tr=q-100',
    //   gender: 'male',
    //   category: 'half-sleeve',
    // ),
    // Product(
    //   id: 'p4',
    //   title: 'Play It Loud Half Sleeve T-Shirt',
    //   // description: ,
    //   price: 299.00,
    //   oldPrice: 499.00,
    //   imageUrl:
    //       'https://images.bewakoof.com/original/play-it-loud-half-sleeve-t-shirt-men-s-printed-t-shirts-209941-1549006235.jpg?tr=q-100',
    //   gender: 'male',
    //   category: 'half-sleeve',
    // ),
    // Product(
    //   id: 'p5',
    //   title: 'Superman Line Full Sleeve T-Shirt (SML)',
    //   // description: ,
    //   price: 349.00,
    //   oldPrice: 499.00,
    //   imageUrl:
    //       'https://images.bewakoof.com/original/superman-line-full-sleeve-t-shirt-sml-men-s-printed-full-sleeve-t-shirt-229649-1566283579.jpg?tr=q-100',
    //   gender: 'male',
    //   category: 'full-sleeve',
    // ),
    // Product(
    //   id: 'p6',
    //   title: 'Highlander Green Checked Shirt',
    //   // description: ,
    //   price: 849.00,
    //   oldPrice: 999.00,
    //   imageUrl:
    //       'https://images.bewakoof.com/original/highlander-green-checked-shirt-men-s-checks-shirts-216000-1559730576.jpg?tr=q-100',
    //   gender: 'male',
    //   category: 'shirt',
    // ),
    // Product(
    //   id: 'p7',
    //   title: 'Cute Peeking Cat Boyfriend T-Shirt',
    //   // description: ,
    //   price: 299.00,
    //   oldPrice: 499.00,
    //   imageUrl:
    //       'https://images.bewakoof.com/original/cute-peeking-cat-boyfriend-t-shirt-women-s-printed-boyfriend-t-shirts-226277-1564729436.jpg?tr=q-100',
    //   gender: 'female',
    //   category: 'half-sleeve',
    // ),
    // Product(
    //   id: 'p8',
    //   title: 'Let\'s Go Penguin Scoop Neck Full Sleeve T-Shirt',
    //   // description: ,
    //   oldPrice: 799.00,
    //   price: 499.00,
    //   imageUrl:
    //       'https://images.bewakoof.com/original/let-s-go-penguin-scoop-neck-full-sleeve-t-shirt-women-s-printed-scoop-neck-full-sleeve-t-shirt-226698-1564825934.jpg?tr=q-100',
    //   gender: 'female',
    //   category: 'full-sleeve',
    // ),
    // Product(
    //   id: 'p9',
    //   title: 'Let\'s Go Penguin Scoop Neck Full Sleeve T-Shirt',
    //   // description: ,
    //   price: 499.00,
    //   oldPrice: 999.00,
    //   imageUrl:
    //       'https://images.bewakoof.com/original/desert-sand-beige-henley-crop-shirt-women-s-henley-crop-shirt-213605-1557914356.jpg?tr=q-100',
    //   gender: 'female',
    //   category: 'shirt',
    // ),
  ];
  // var _showFavoritesOnly = false;
  final String authToken;
  final String userId;
  Products(this.authToken, this.userId, this._items);

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }
  List<Product> get favoriteItem {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> addProduct(Product product) async {
    final url =
        'https://bewakoof-d4c2f.firebaseio.com/products.json?auth=$authToken';
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'title': product.title,
            'oldPrice': product.oldPrice,
            'price': product.price,
            'imageUrl': product.imageUrl,
            'gender': product.gender,
            'category': product.category,
          },
        ),
      );
      final newProduct = Product(
        title: product.title,
        category: product.category,
        gender: product.gender,
        id: json.decode(response.body)['name'],
        imageUrl: product.imageUrl,
        price: product.price,
        oldPrice: product.oldPrice,
      );
      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      final url =
          'https://bewakoof-d4c2f.firebaseio.com/products/$id.json?auth=$authToken';
      await http.patch(
        url,
        body: json.encode(
          {
            'title': newProduct.title,
            'category': newProduct.category,
            'gender': newProduct.gender,
            'imageUrl': newProduct.imageUrl,
            'price': newProduct.price,
            'oldPrice': newProduct.oldPrice,
          },
        ),
      );
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('....');
    }
  }

  Future<void> deleteProduct(String id) async {
    final url =
        'https://bewakoof-d4c2f.firebaseio.com/products/$id.json?auth=$authToken';
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    var existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Could not delete product.');
    }
    existingProduct = null;
  }

  Future<void> fetchAndSetProducts() async {
    var url =
        'https://bewakoof-d4c2f.firebaseio.com/products.json?auth=$authToken';
    try {
      final response = await http.get(url);
      final extratedData = json.decode(response.body) as Map<String, dynamic>;

      if (extratedData == null) {
        return;
      }
      url =
          'https://bewakoof-d4c2f.firebaseio.com/userFavorite/$userId.json?auth=$authToken';
      final favoriteResponse = await http.get(url);
      final favoriteData = json.decode(favoriteResponse.body);

      final List<Product> loadedProduct = [];
      extratedData.forEach((prodId, prodData) {
        loadedProduct.add(Product(
          id: prodId,
          title: prodData['title'],
          category: prodData['category'],
          gender: prodData['gender'],
          imageUrl: prodData['imageUrl'],
          oldPrice: prodData['oldPrice'],
          price: prodData['price'],
          isFavorite:
              favoriteData == null ? false : favoriteData[prodId] ?? false,
        ));
      });
      _items = loadedProduct;
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
