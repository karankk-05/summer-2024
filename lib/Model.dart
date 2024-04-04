import 'package:flutter/foundation.dart';

class Product {
  final String sender;
  final String timestamp;
  final String subject;
  final String attachmentList;
  

  Product({
     required this.sender,
    required this.timestamp,
    required this.subject,
    required this.attachmentList,
   
  });
    
  }

class CartModel extends ChangeNotifier {
  final List<Product> _cart = [];

  List<Product> get cart => _cart;

  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  bool isProductInCart(String productName) {
    return _cart.any((product) => product.sender == productName);
  }
}
