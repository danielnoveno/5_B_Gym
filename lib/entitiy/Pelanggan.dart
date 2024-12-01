import 'dart:convert';

class Pelanggan {
  int idPelanggan;
  String nama;
  int umur;
  String alamat;
  String noTelepon;
  String email;
  String password;
  DateTime tanggalDaftar;

  Pelanggan({
    required this.idPelanggan,
    required this.nama,
    required this.umur,
    required this.alamat,
    required this.noTelepon,
    required this.email,
    required this.password,
    required this.tanggalDaftar,
  });

  // Convert a Pelanggan into a Map
  Map<String, dynamic> toMap() {
    return {
      'idPelanggan': idPelanggan,
      'nama': nama,
      'umur': umur,
      'alamat': alamat,
      'noTelepon': noTelepon,
      'email': email,
      'password': password,
      'tanggalDaftar': tanggalDaftar.toIso8601String(),
    };
  }

  // Convert a Pelanggan into a JSON string
  String toRawJson() {
    return json.encode(toMap());
  }

  // Convert a JSON string into a Pelanggan object
  factory Pelanggan.fromJson(Map<String, dynamic> json) {
    return Pelanggan(
      idPelanggan: json['idPelanggan'],
      nama: json['nama'],
      umur: json['umur'],
      alamat: json['alamat'],
      noTelepon: json['noTelepon'],
      email: json['email'],
      password: json['password'],
      tanggalDaftar: DateTime.parse(json['tanggalDaftar']),
    );
  }
}
