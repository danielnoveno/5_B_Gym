import 'dart:convert';

class CartItem {
  int id; // ID item dalam keranjang
  String membershipTitle; // Nama keanggotaan atau produk
  String image; // Nama file gambar
  int price; // Harga item
  int quantity; // Jumlah item yang dibeli
  bool isSelected; // Status item apakah dipilih

  // Constructor dengan parameter wajib dan default untuk opsional
  CartItem({
    required this.id,
    required this.membershipTitle,
    required this.image,
    required this.price,
    this.quantity = 1,
    this.isSelected = false,
  });

  // Membuat objek CartItem dari string JSON
  factory CartItem.fromRawJson(String str) {
    final Map<String, dynamic> jsonData = json.decode(str);
    return CartItem.fromJson(jsonData);
  }

  // Membuat objek CartItem dari map JSON
  factory CartItem.fromJson(Map<String, dynamic> json) {
    if (json["id"] == null || json["membership_title"] == null) {
      throw Exception(
          "Data JSON tidak valid, ID dan membership_title diperlukan");
    }
    return CartItem(
      id: json["id"],
      membershipTitle: json["membership_title"],
      image: json["image"] ?? '', // Default kosong jika gambar tidak ada
      price: json["price"] ?? 0, // Default 0 jika harga tidak disediakan
      quantity: json["quantity"] ?? 1, // Default 1 jika jumlah tidak ada
      isSelected: json["is_selected"] ?? false, // Default tidak dipilih
    );
  }

  // Mengonversi objek CartItem menjadi string JSON
  String toRawJson() => json.encode(toJson());

  List<CartItem> convertToCartItems(List<dynamic> cartItems) {
    return cartItems
        .map((item) => CartItem.fromJson(item))
        .toList(); // Adjust this according to your CartItem model
  }

  // Mengonversi objek CartItem menjadi map JSON
  Map<String, dynamic> toJson() => {
        "id": id,
        "membership_title": membershipTitle,
        "image": image,
        "price": price,
        "quantity": quantity,
        "is_selected": isSelected,
      };

  // Metode untuk mendapatkan URL gambar lengkap
  String getImageUrl() {
    const baseUrl = 'http://127.0.0.1:8000'; // Ganti dengan base URL API Anda
    return '$baseUrl/storage/app/public/images/$image';
  }
}
