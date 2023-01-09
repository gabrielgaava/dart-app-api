class User {
  User(this.name, this.email);
  String name;
  String email;

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email};
  }

  factory User.fromJson(Map<String, dynamic> json) {
    print(json);
    final name = json['name'] as String;
    final email = json['email'] as String;
    return User(name, email);
  }
}
