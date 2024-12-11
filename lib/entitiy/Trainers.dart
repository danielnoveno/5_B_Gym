import 'dart:convert';
// import 'dart:ffi';

class Trainers {
  int idTrainer;
  String title;
  String duration;
  String? imagePath;
  String email;
  String description;
  String specialization;
  double price;

  Trainers({
    required this.idTrainer,
    required this.title,
    required this.duration,
    required this.imagePath,
    required this.email,
    required this.description,
    required this.specialization,
    required this.price,
  });

  // Membuat objek trainer dari data JSON yang diterima dari API
  factory Trainers.fromRawJson(String str) =>
      Trainers.fromJson(json.decode(str));

  factory Trainers.fromJson(Map<String, dynamic> json) => Trainers(
        idTrainer: json["id_trainer"],
        title: json["title"],
        duration: json["duration"],
        imagePath: json["imagePath"],
        email: json["email"],
        description: json["description"],
        specialization: json["specialization"],
        price: json["price"].toDouble(),
      );

  // Mengonversi objek trainer menjadi data JSON untuk dikirim ke API
  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "id_trainer": idTrainer,
        "title": title,
        "duration": duration,
        "imagePath": imagePath,
        "email": email,
        "description": description,
        "specialization": specialization,
        "price": price,
      };
}
