import 'package:shelf/shelf.dart';

import '../models/Token.dart';
import '../services/AuthService.dart';

Middleware auth() => (innerHandler) {
      return (request) async {
        /* The middleware execution */
        var token = request.headers["Authorization"];

        if (token == null) {
          return Response.forbidden("Forbidden");
        } else {
          String jwtToken = token.replaceAll("Bearer ", "");
          Token? tokenDto = await AuthService.validateToken(jwtToken);

          if (tokenDto != null) {
            return innerHandler(request);
          } else {
            return Response.forbidden("Forbidden");
          }
        }
      };
    };
