class Membership {
  final int id;
  final String category;
  final String title;
  final List<String> description;
  final String price;
  final String total;

  Membership({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.price,
    required this.total,
  });

  factory Membership.fromJson(Map<String, dynamic> json) {
    return Membership(
      id: json['id'],
      category: json['category'],
      title: json['title'],
      description: List<String>.from(json['description']),
      price: json['price'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'title': title,
      'description': description,
      'price': price,
      'total': total,
    };
  }
}
