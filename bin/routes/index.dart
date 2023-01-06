import 'package:shelf_plus/shelf_plus.dart';
import 'user.dart';

class RouterIndex {
  RouterPlus app = Router().plus;

  RouterPlus build() {
    UserRoutes().compose(app);

    return app;
  }
}
