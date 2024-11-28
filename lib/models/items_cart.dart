enum CartItemType { membership, trainer, healthy_club }

class CartItem {
  final String title;
  final double price;
  final String image;
  int quantity;
  bool isSelected;
  final String membershipTitle;
  final CartItemType type;

  CartItem({
    required this.title,
    required this.price,
    required this.image,
    this.quantity = 1,
    this.isSelected = false,
    required this.membershipTitle,
    required this.type,
  });
}
