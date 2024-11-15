class CartItem {
  final String title;
  final String price;
  final String image;
  bool isSelected;
  int quantity;

  CartItem(this.title, this.price, this.image,
      {this.isSelected = false, this.quantity = 1});
}
