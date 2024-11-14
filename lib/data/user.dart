class User {
  final String name;
  final String email;
  final String phone;
  final String role;
  final String? weight;
  final String? height;
  final String? age;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    this.weight,
    this.height,
    this.age,
  });
}
