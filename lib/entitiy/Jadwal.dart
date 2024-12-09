class Activity {
  final String activity;
  final DateTime createdAt;
  DateTime? finishAt;
  final DateTime date;

  Activity({
    required this.activity,
    required this.createdAt,
    this.finishAt,
    required this.date,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      activity: json['activity'],
      createdAt: DateTime.parse(json['created_at'])
          .toLocal(), // Mengubah ke waktu lokal
      finishAt: json['finish_at'] != null
          ? DateTime.parse(json['finish_at'])
              .toLocal() // Mengubah ke waktu lokal
          : null,
      date: DateTime.parse(json['date']).toLocal(), // Mengubah ke waktu lokal
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'activity': activity,
      'created_at': createdAt.toUtc().toIso8601String(), // Mengirim waktu UTC
      'finish_at': finishAt?.toUtc().toIso8601String(),
      'date': date.toUtc().toIso8601String(), // Mengirim waktu UTC
    };
  }
}
