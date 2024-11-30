import 'dart:convert';

class Pelanggan {
  int idPelanggan;
  String nama;
  int umur;
  String alamat;
  String noTelepon;
  String email;
  DateTime tanggalDaftar;

  Pelanggan({
    required this.idPelanggan,
    required this.nama,
    required this.umur,
    required this.alamat,
    required this.noTelepon,
    required this.email,
    required this.tanggalDaftar,
  });

  // Membuat objek Pelanggan dari data JSON yang diterima dari API
  factory Pelanggan.fromRawJson(String str) =>
      Pelanggan.fromJson(json.decode(str));
  factory Pelanggan.fromJson(Map<String, dynamic> json) => Pelanggan(
        idPelanggan: json["id_pelanggan"],
        nama: json["nama"],
        umur: json["umur"],
        alamat: json["alamat"],
        noTelepon: json["no_telepon"],
        email: json["email"],
        tanggalDaftar: DateTime.parse(json["tanggal_daftar"]),
      );

  // Mengonversi objek Pelanggan menjadi data JSON untuk dikirim ke API
  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
        "id_pelanggan": idPelanggan,
        "nama": nama,
        "umur": umur,
        "alamat": alamat,
        "no_telepon": noTelepon,
        "email": email,
        "tanggal_daftar": tanggalDaftar.toIso8601String(),
      };
}
