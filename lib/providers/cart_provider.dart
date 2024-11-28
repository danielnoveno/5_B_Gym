import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/models/items_cart.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addItem(CartItem item) {
    final existingItemIndex = _cartItems.indexWhere(
      (cartItem) =>
          cartItem.title == item.title &&
          cartItem.membershipTitle == item.membershipTitle,
    );

    if (existingItemIndex != -1) {
      _cartItems[existingItemIndex].quantity += 1;
    } else {
      item.quantity = 1;
      _cartItems.add(item);
    }

    notifyListeners();
  }

  List<CartItem> getMembershipItems() {
    return _cartItems
        .where((item) => item.type == CartItemType.membership)
        .toList();
  }

  List<CartItem> getTrainerItems() {
    return _cartItems
        .where((item) => item.type == CartItemType.trainer)
        .toList();
  }

  List<CartItem> getHealthyClubItems() {
    return _cartItems
        .where((item) => item.type == CartItemType.healthy_club)
        .toList();
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

  void removeItem(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // Fungsi untuk menghapus semua item yang dipilih
  void clearSelectedItems() {
    _cartItems.removeWhere((item) => item.isSelected);
    notifyListeners();
  }

  // Fungsi untuk menghapus semua item dari keranjang
  void clearAllItems() {
    _cartItems.clear();
    notifyListeners();
  }
}
