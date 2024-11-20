class CartItem {
  final String title;
  final String price;
  final String image;
  int quantity;
  bool isSelected;
  final String membershipTitle;

  CartItem({
    required this.title,
    required this.price,
    required this.image,
    this.quantity = 1,
    this.isSelected = false,
    required this.membershipTitle,
  });
}
