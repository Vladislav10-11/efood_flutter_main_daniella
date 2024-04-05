class User {
  final int id;
  final String name;
  final String password;
  final String email;
  final List<String> allergies;

  User({
    required this.id,
    required this.name,
    required this.password,
    required this.email,
    required this.allergies,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      password: json['password'],
      email: json['email'],
      allergies: List<String>.from(json['allergies']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'password': password,
        'email': email,
        'allergies': allergies,
      };
}
