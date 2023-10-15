class User {
  int id;
  String email;
  String password;
  String name;
  

  User({required this.id, required this.email, required this.password,required this.name});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': email,
      'password': password,
      'name': name
    };
  }

  factory User.fromJson(Map<String, Object?> json) {
    return User(
      id: json['id'] as int,
      email: json['email'] as String,
      password: json['password'] as String,
      name: json['name'] as String
    );
  }
}
