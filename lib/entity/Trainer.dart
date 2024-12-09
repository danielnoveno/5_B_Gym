import 'dart:convert';

class Trainer {
  int id;
  String title;
  String duration;
  String imagePath;
  String email;
  String description;
  String specialization;
  double price;

  Trainer({
    required this.id,
    required this.title,
    required this.duration,
    required this.imagePath,
    required this.email,
    required this.description,
    required this.specialization,
    required this.price,
  });

  // Membuat objek Trainer dari data JSON yang diterima dari API
  factory Trainer.fromRawJson(String str) => Trainer.fromJson(json.decode(str));

  factory Trainer.fromJson(Map<String, dynamic> json) => Trainer(
        id: json["id"],
        title: json["title"],
        duration: json["duration"],
        imagePath: json["image_path"],
        email: json["email"],
        description: json["description"],
        specialization: json["specialization"],
        price: json["price"].toDouble(),
      );

  // Mengonversi objek Trainer menjadi data JSON untuk dikirim ke API
  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "duration": duration,
        "image_path": imagePath,
        "email": email,
        "description": description,
        "specialization": specialization,
        "price": price,
      };
}
