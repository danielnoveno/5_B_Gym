import 'dart:convert';

class AlatGym {
  int idAlat;
  String namaAlat;
  String deskripsi;
  double harga;

  AlatGym({
    required this.idAlat,
    required this.namaAlat,
    required this.deskripsi,
    required this.harga,
  });

  // Membuat objek AlatGym dari data JSON yang diterima dari API
  factory AlatGym.fromRawJson(String str) => AlatGym.fromJson(json.decode(str));

  factory AlatGym.fromJson(Map<String, dynamic> json) => AlatGym(
        idAlat: json["id_alat"],
        namaAlat: json["nama_alat"],
        deskripsi: json["deskripsi"],
        harga: json["harga"].toDouble(),
      );

  // Mengonversi objek AlatGym menjadi data JSON untuk dikirim ke API
  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "id_alat": idAlat,
        "nama_alat": namaAlat,
        "deskripsi": deskripsi,
        "harga": harga,
      };
}
