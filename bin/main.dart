import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_plus/shelf_plus.dart';
import 'routes/index.dart';

void main(List<String> arguments) async {
  var routes = RouterIndex().build();
  var pipe = Pipeline()
      .addMiddleware(setContentType("json/application"))
      .addMiddleware(logRequests())
      .addHandler(routes);

  var server = await io.serve(pipe, 'localhost', 8080);
  server.autoCompress = true;

  print('Serving at http://${server.address.host}:${server.port}');
}

Response _echoRequest(Request request) =>
    Response.ok('Request for "${request.url}"');
