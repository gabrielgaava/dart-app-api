class User {
  String name;
  String email;
  User(this.name, this.email);

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email};
  }

  factory User.fromJson(Map<String, dynamic> json) {
    final name = json['name'] as String;
    final email = json['email'] as String;
    return User(name, email);
  }
}
