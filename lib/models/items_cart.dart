// Removed the unused import statement for 'dart:convert'

enum CartItemType { membership, trainer, healthy_club }

class CartItem {
  int id;
  String membershipTitle;
  String image;
  int price;
  int quantity;
  bool isSelected;

  CartItem({
    required this.id,
    required this.membershipTitle,
    required this.image,
    required this.price,
    this.quantity = 1,
    this.isSelected = false,
  });

  // Assuming you have a fromJson method to convert dynamic to CartItem
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      membershipTitle: json['membershipTitle'],
      image: json['image'],
      price: json['price'],
      quantity: json['quantity'] ?? 1,
      isSelected: json['isSelected'] ?? false,
    );
  }

  // Convert a list of dynamic cart items to CartItem objects
  static List<CartItem> convertToCartItems(List<dynamic> cartItems) {
    return cartItems.map((item) => CartItem.fromJson(item)).toList();
  }
}
