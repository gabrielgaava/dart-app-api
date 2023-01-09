import '../models/Token.dart';
import '../settings/database.dart';

abstract class AuthService {
  static Future<Token?> validateToken(String jwtToken) async {
    if (jwtToken.isEmpty) return null;

    Map<String, dynamic> data = await Database().query(
        "SELECT * FROM tokens WHERE token_id = @token", {'token': jwtToken});

    print(data);
    if (data.isEmpty) return null;

    Token token = Token.fromJson(data);
    print(token);

    if (token.id != jwtToken) return null;

    return token;
  }
}
