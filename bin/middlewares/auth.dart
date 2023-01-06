import 'package:shelf/shelf.dart';

Middleware auth() => (innerHandler) {
      return (request) {
        /* The middleware execution */
        var token = request.headers["Authorization"];
        print("Token $token");

        if (token == "Bearer 123") {
          return innerHandler(request);
        } else {
          return Response.forbidden("Forbidden");
        }
      };
    };
