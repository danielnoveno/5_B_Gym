import 'dart:convert';

class KelasOlahragas {
  int idKelas;
  String judul;
  String harga;
  String imagePath;
  List<String> deskripsi;
  List<String> kelas;

  KelasOlahragas({
    required this.idKelas,
    required this.judul,
    required this.harga,
    required this.imagePath,
    required this.deskripsi,
    required this.kelas,
  });

  factory KelasOlahragas.fromRawJson(String str) =>
      KelasOlahragas.fromJson(json.decode(str));

  factory KelasOlahragas.fromJson(Map<String, dynamic> json) {
    return KelasOlahragas(
      idKelas: json["id_kelas"] ?? 0,
      judul: json["judul"] ?? '',
      harga: json["harga"] ?? '',
      imagePath: json["image_path"] ?? '',
      deskripsi: List<String>.from(json["deskripsi"] ?? []),
      kelas: List<String>.from(json["kelas"] ?? []),
    );
  }

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "id_kelas": idKelas,
        "judul": judul,
        "harga": harga,
        "image_path": imagePath,
        "deskripsi": deskripsi,
        "kelas": kelas,
      };
}
