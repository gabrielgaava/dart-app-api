import 'package:shelf/shelf.dart';
import 'dart:convert';
import '../models/User.dart';
import '../settings/database.dart';

class UserController {
  UserController();

  Future<Response> listUsers(Request request) async {
    var data = await Database().query("select * from users", null);
    List<User> users = List<User>.from((data.map((i) => User.fromJson(i))));
    return Response.ok(jsonEncode(users));
  }

  Future<Response> getUser(Request request, String id) async {
    var data = await Database()
        .query("select * from users where id = @id", {"id": id});

    var response = User.fromJson(data);
    return Response.ok(jsonEncode(response));
  }
}
