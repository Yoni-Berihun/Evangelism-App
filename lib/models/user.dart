class User {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String role; // e.g. "admin" or "missionary"

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone_number': phoneNumber,
        'role': role,
      };
}