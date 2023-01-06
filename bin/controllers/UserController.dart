import 'package:shelf/shelf.dart';
import 'dart:convert';
import '../models/User.dart';

class UserController {
  UserController();

  Future<Response> listUsers(Request request) async {
    User user1 = User("Gabriel Gava", "nero.gava@gmail.com");
    User user2 = User("Maikel Oliveira", "maikel@gmail.com");
    List<User> users = [user1, user2];

    return Response.ok(jsonEncode(users));
  }

  Future<Response> getUser(Request request, String id) async {
    User user1 = User("Gabriel Gava", "nero.gava@gmail.com");
    return Response.ok(jsonEncode(user1));
  }
}
