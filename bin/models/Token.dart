class Token {
  String id;
  String userId;
  DateTime expireAt;
  DateTime createdAt;
  Token(this.id, this.userId, this.expireAt, this.createdAt);

  Map<String, dynamic> toJson() {
    return {
      'token': id,
      'user_id': userId,
      'expire_at': expireAt,
      'created_at': createdAt
    };
  }

  factory Token.fromJson(Map<String, dynamic> json) {
    print(json);
    final token = json['token_id'] as String;
    final user = json['user_id'] as String;
    final expire = json['expire_at'] as DateTime;
    final created = json['created_at'] as DateTime;
    return Token(token, user, expire, created);
  }
}
