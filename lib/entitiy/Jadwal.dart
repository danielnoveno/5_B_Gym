import 'dart:convert';

class Activity {
  int id;
  String activity;
  DateTime? finishAt;
  String date;
  DateTime createdAt;
  DateTime updatedAt;

  Activity({
    required this.id,
    required this.activity,
    this.finishAt,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
  });

  // Membuat objek Activity dari data JSON yang diterima dari API
  factory Activity.fromRawJson(String str) =>
      Activity.fromJson(json.decode(str));

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        activity: json["activity"],
        finishAt: json["finish_at"] != null
            ? DateTime.parse(json["finish_at"])
            : null,
        date: json["date"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  // Mengonversi objek Activity menjadi data JSON untuk dikirim ke API
  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "id": id,
        "activity": activity,
        "finish_at": finishAt != null ? finishAt!.toIso8601String() : null,
        "date": date,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
