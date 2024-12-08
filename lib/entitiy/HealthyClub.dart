import 'dart:convert';

class KelasOlahraga {
  int idKelas;
  String judul;
  String harga;
  String imagePath;
  List<String> deskripsi;
  int? idJadwal;
  int? idRuangan;
  int? idCoach;
  List<String> kelas;

  KelasOlahraga({
    required this.idKelas,
    required this.judul,
    required this.harga,
    required this.imagePath,
    required this.deskripsi,
    this.idJadwal,
    this.idRuangan,
    this.idCoach,
    required this.kelas,
  });

  factory KelasOlahraga.fromRawJson(String str) =>
      KelasOlahraga.fromJson(json.decode(str));

  factory KelasOlahraga.fromJson(Map<String, dynamic> json) => KelasOlahraga(
        idKelas: json["id_kelas"] ?? 0,
        judul: json["judul"] ?? '',
        harga: json["harga"] ?? '',
        imagePath: json["image_path"] ?? '',
        deskripsi: List<String>.from(json["deskripsi"] ?? []),
        idJadwal: json["id_jadwal"],
        idRuangan: json["id_ruangan"],
        idCoach: json["id_coach"],
        kelas: List<String>.from(json["kelas"] ?? []),
      );

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "id_kelas": idKelas,
        "judul": judul,
        "harga": harga,
        "image_path": imagePath,
        "deskripsi": deskripsi,
        "id_jadwal": idJadwal,
        "id_ruangan": idRuangan,
        "id_coach": idCoach,
        "kelas": kelas,
      };
}
