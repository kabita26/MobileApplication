import 'package:flutter/material.dart';
import 'package:skincare_android/model/CartModel.dart';

class CartViewModel extends ChangeNotifier {
  CartModel _cartModel = CartModel();

  CartModel get cartItems => _cartModel;

  void addToCart(String itemName, int quantity, String price) {
    _cartModel.addItem(itemName, quantity, price);
    notifyListeners();
  }

  void removeFromCart(String itemName) {
    _cartModel.removeItem(itemName);
    notifyListeners();
  }

  void increaseQuantity(String itemName) {
    _cartModel.incrementItemQuantity(itemName);
    notifyListeners();
  }

  void decreaseQuantity(String itemName) {
    _cartModel.decrementItemQuantity(itemName);
    notifyListeners();
  }
}
