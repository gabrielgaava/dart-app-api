import 'package:shelf_plus/shelf_plus.dart';
import '../controllers/UserController.dart';
import '../middlewares/auth.dart';

class UserRoutes {
  compose(RouterPlus app) {
    app.get('/user', UserController().listUsers);
    app.get('/user/<id>', UserController().getUser, use: auth());

    return app;
  }
}
