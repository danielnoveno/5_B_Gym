import 'dart:convert';
import 'package:decimal/decimal.dart';

class GymEquipment {
  String imagePath;
  String namaAlat;
  String deskripsi;
  Decimal harga; // Ubah menjadi Decimal
  int quantity;

  GymEquipment({
    required this.imagePath,
    required this.namaAlat,
    required this.deskripsi,
    required this.harga,
    this.quantity = 0,
  });

  // Membuat objek GymEquipment dari data JSON yang diterima dari API
  factory GymEquipment.fromRawJson(String str) =>
      GymEquipment.fromJson(json.decode(str));

  factory GymEquipment.fromJson(Map<String, dynamic> json) => GymEquipment(
        imagePath: json["image_path"],
        namaAlat: json["nama_alat"],
        deskripsi: json["deskripsi"],
        harga: _parseDecimal(json["harga"]), // Memastikan harga menjadi Decimal
        quantity: json["quantity"] ?? 0, // Memastikan quantity sebagai integer
      );

  // Fungsi untuk memastikan konversi harga menjadi Decimal
  static Decimal _parseDecimal(dynamic value) {
    if (value is String) {
      return Decimal.parse(
          value); // Jika berupa String, konversi menjadi Decimal
    } else if (value is num) {
      return Decimal.fromInt(value
          .toInt()); // Jika berupa angka (int atau double), konversi menjadi Decimal
    }
    return Decimal.zero; // Default ke Decimal.zero jika tidak dapat diparsing
  }

  // Mengonversi objek GymEquipment menjadi data JSON untuk dikirim ke API
  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "image_path": imagePath,
        "nama_alat": namaAlat,
        "deskripsi": deskripsi,
        "harga": harga
            .toString(), // Mengonversi Decimal menjadi String untuk dikirim ke API
        "quantity": quantity,
      };

  String getImageUrl() {
    if (imagePath == null) return 'assets/images/placeholder.png';
    return 'http://127.0.0.1:8000/storage/app/public/images/$imagePath'; // Menyesuaikan URL berdasarkan image
  }
}