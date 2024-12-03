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
        image: json["image"],
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
}
