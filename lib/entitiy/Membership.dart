import 'dart:convert';

class Membership {
  int idMembership;
  String title;
  String? image;
  String duration;

  Membership({
    required this.idMembership,
    required this.title,
    this.image,
    required this.duration,
  });

  // Membuat objek Membership dari data JSON yang diterima dari API
  factory Membership.fromRawJson(String str) =>
      Membership.fromJson(json.decode(str));

  factory Membership.fromJson(Map<String, dynamic> json) => Membership(
        idMembership: json["id_membership"],
        title: json["title"],
        image: json["image"], // Nama gambar yang diterima dari API
        duration: json["duration"],
      );

  // Mengonversi objek Membership menjadi data JSON untuk dikirim ke API
  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "id_membership": idMembership,
        "title": title,
        "image": image,
        "duration": duration,
      };

  // Menambahkan metode untuk mendapatkan URL gambar lengkap
  String getImageUrl() {
    if (image == null) return 'assets/images/placeholder.png';
    return 'http://127.0.0.1:8000/storage/app/public/images/$image'; // Menyesuaikan URL berdasarkan image
  }
}
