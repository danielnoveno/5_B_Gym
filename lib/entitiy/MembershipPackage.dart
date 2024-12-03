class MembershipPackage {
  final int id;
  final String title;
  final List<String> description;
  final String price;
  final String total;

  MembershipPackage({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.total,
  });

  // Fungsi untuk membuat object dari JSON
  factory MembershipPackage.fromJson(Map<String, dynamic> json) {
    return MembershipPackage(
      id: json['id'],
      title: json['title'],
      description: List<String>.from(json['description']),
      price: json['price'],
      total: json['total'],
    );
  }

  // Fungsi untuk mengubah object menjadi JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'total': total,
    };
  }
}
