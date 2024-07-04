import 'package:flutter/cupertino.dart';

import '../models/product.dart';

final cart = Cart();

class Cart with ChangeNotifier {
  List<ProductInfo> _content = [];

  void addToCart(ProductInfo product) {
    _content.add(product);
    notifyListeners();
  }

  void removeFromCart(ProductInfo product) {
    _content.remove(product);
    notifyListeners();
  }

  int get count => _content.length;

  ProductInfo item(int index) => _content[index];

  bool isContains(ProductInfo product) => _content.contains(product);
}
