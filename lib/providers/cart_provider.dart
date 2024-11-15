import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/models/items_cart.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addItem(CartItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void updateQuantity(int index, int newQuantity) {
    _cartItems[index].quantity = newQuantity;
    notifyListeners();
  }

  void updateSelection(int index, bool isSelected) {
    _cartItems[index].isSelected = isSelected;
    notifyListeners();
  }

  void selectAllItems(bool selectAll) {
    for (var item in _cartItems) {
      item.isSelected = selectAll;
    }
    notifyListeners();
  }

  // Fungsi untuk menghapus item berdasarkan index
  void removeItem(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }
}

