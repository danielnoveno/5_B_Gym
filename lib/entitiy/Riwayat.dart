import 'dart:convert';

class Riwayat {
  int idRiwayat;
  int idPelanggan;  // Added idPelanggan
  DateTime tanggalRiwayat;
  String jenisLayanan;
  double totalHarga;
  String imagePath;  // Added imagePath as nullable

  Riwayat({
    required this.idRiwayat,
    required this.idPelanggan, // Added idPelanggan to constructor
    required this.tanggalRiwayat,
    required this.jenisLayanan,
    required this.totalHarga,
    required this.imagePath, // Added imagePath to constructor (nullable)
  });

  // Membuat objek Riwayat dari data JSON yang diterima dari API
  factory Riwayat.fromRawJson(String str) => Riwayat.fromJson(json.decode(str));

  factory Riwayat.fromJson(Map<String, dynamic> json) => Riwayat(
        idRiwayat: json["id_riwayat"],
        idPelanggan: json["id_pelanggan"],  // Parsing idPelanggan from JSON
        tanggalRiwayat: DateTime.parse(json["tanggal_riwayat"]),
        jenisLayanan: json["jenis_layanan"],
        totalHarga: (json["total_harga"] as num).toDouble(),
        imagePath: json["image_path"],  // Parsing image_path from JSON (nullable)
      );

  // Mengonversi objek Riwayat menjadi data JSON untuk dikirim ke API
  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "id_riwayat": idRiwayat,
        "id_pelanggan": idPelanggan,  // Adding idPelanggan to JSON
        "tanggal_riwayat": tanggalRiwayat.toIso8601String(),
        "jenis_layanan": jenisLayanan,
        "total_harga": totalHarga,
        "image_path": imagePath,  // Adding image_path to JSON (nullable)
      };
}
