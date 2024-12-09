import 'dart:convert';

class JenisMembership {
  int idJenisMembership;
  String membershipTitle;
  String type;
  List<String> features;
  double price;
  int total;

  JenisMembership({
    required this.idJenisMembership,
    required this.membershipTitle,
    required this.type,
    required this.features,
    required this.price,
    required this.total,
  });

  factory JenisMembership.fromRawJson(String str) =>
      JenisMembership.fromJson(json.decode(str));

  factory JenisMembership.fromJson(Map<String, dynamic> json) =>
      JenisMembership(
        idJenisMembership: json["id"] ?? 0,
        membershipTitle: json["membership_title"] ?? '',
        type: json["type"] ?? '',
        features: List<String>.from(json["description"]["features"] ?? []),
        price: (json["price"] is String)
            ? double.tryParse(json["price"]) ??
                0.0 // Menangani jika price berupa string
            : (json["price"] is int ? json["price"].toDouble() : json["price"]),
        total: (json["total"] is String)
            ? int.tryParse(json["total"]) ??
                0 // Menangani jika total berupa string
            : (json["total"] is int ? json["total"] : 0),
      );

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "id": idJenisMembership,
        "membership_title": membershipTitle,
        "type": type,
        "description": {"features": features},
        "price": price,
        "total": total,
      };
}
