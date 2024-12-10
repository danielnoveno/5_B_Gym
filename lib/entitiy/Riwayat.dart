import 'dart:convert';

class Riwayat {
  int idRiwayat;
  DateTime tanggalRiwayat;
  String jenisLayanan;
  double totalHarga;

  Riwayat({
    required this.idRiwayat,
    required this.tanggalRiwayat,
    required this.jenisLayanan,
    required this.totalHarga,
  });

  // Membuat objek Riwayat dari data JSON yang diterima dari API
  factory Riwayat.fromRawJson(String str) => Riwayat.fromJson(json.decode(str));

  factory Riwayat.fromJson(Map<String, dynamic> json) => Riwayat(
        idRiwayat: json["id_riwayat"],
        tanggalRiwayat: DateTime.parse(json["tanggal_riwayat"]),
        jenisLayanan: json["jenis_layanan"],
        totalHarga: (json["total_harga"] as num).toDouble(),
      );

  // Mengonversi objek Riwayat menjadi data JSON untuk dikirim ke API
  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "id_riwayat": idRiwayat,
        "tanggal_riwayat": tanggalRiwayat.toIso8601String(),
        "jenis_layanan": jenisLayanan,
        "total_harga": totalHarga,
      };
}
