import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/entitiy/Cart.dart';
import 'package:tubes_pbp_gym/client/CartClient.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  // Fetch all cart items from the API
  Future<void> fetchCartItems() async {
    try {
      _cartItems = await CartItemClient.fetchAll();
      notifyListeners();
    } catch (e) {
      print("Failed to fetch cart items: $e");
    }
  }

  void removeItemById(int id) {
    _cartItems.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  // Add an item to the cart and sync with the server
  Future<void> addItem(CartItem item) async {
    final existingItemIndex = _cartItems.indexWhere(
      (cartItem) =>
          cartItem.membershipTitle == item.membershipTitle &&
          cartItem.id == item.id,
    );

    if (existingItemIndex != -1) {
      _cartItems[existingItemIndex].quantity += 1;
      await updateCartItem(_cartItems[existingItemIndex]);
    } else {
      item.quantity = 1;
      _cartItems.add(item);
      await createCartItem(item);
    }

    notifyListeners();
  }

  // Create a new cart item on the server
  Future<void> createCartItem(CartItem cartItem) async {
    try {
      await CartItemClient.create(cartItem);
    } catch (e) {
      print("Failed to create cart item: $e");
    }
  }

  // Update an existing cart item on the server
  Future<void> updateCartItem(CartItem cartItem) async {
    try {
      await CartItemClient.update(cartItem);
    } catch (e) {
      print("Failed to update cart item: $e");
    }
  }

  // Remove an item from the cart
  Future<void> removeItem(int index) async {
    try {
      await CartItemClient.destroy(_cartItems[index].id);
      _cartItems.removeAt(index);
      notifyListeners();
    } catch (e) {
      print("Failed to remove cart item: $e");
    }
  }

  // Update quantity of an item
  void updateQuantity(int index, int newQuantity) {
    _cartItems[index].quantity = newQuantity;
    updateCartItem(_cartItems[index]);
    notifyListeners();
  }

  // Update selection status of an item
  void updateSelection(int index, bool isSelected) {
    _cartItems[index].isSelected = isSelected;
    notifyListeners();
  }

  // Select or deselect all items in the cart
  void selectAllItems(bool selectAll) {
    for (var item in _cartItems) {
      item.isSelected = selectAll;
    }
    notifyListeners();
  }

  // Clear selected items from the cart
  void clearSelectedItems() {
    _cartItems.removeWhere((item) => item.isSelected);
    notifyListeners();
  }

  // Clear all items from the cart
  void clearAllItems() {
    _cartItems.clear();
    notifyListeners();
  }
}
