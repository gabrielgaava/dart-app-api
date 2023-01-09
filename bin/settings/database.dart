import 'dart:mirrors';

import 'package:dotenv/dotenv.dart';
import 'package:postgres/postgres.dart';

class Database {
  var env = DotEnv(includePlatformEnvironment: true)..load();
  late PostgreSQLConnection connection;

  String get hostname {
    return env["DB_HOST"].toString();
  }

  String get username {
    return env["DB_USER"].toString();
  }

  int get port {
    var val = env["DB_PORT"];
    if (val != null) {
      return int.parse(val);
    }

    return 0;
  }

  String get password {
    return env["DB_PASS"].toString();
  }

  String get database {
    return env["DB_NAME"].toString();
  }

  Future<PostgreSQLConnection> startConnection() async {
    connection = PostgreSQLConnection(hostname, port, database,
        username: username, password: password);

    await connection.open();
    return connection;
  }

  Future<dynamic> query(String sql, Map<String, dynamic>? values) async {
    await startConnection();

    List<Map<String, Map<String, dynamic>>> data =
        await connection.mappedResultsQuery(sql, substitutionValues: values);

    print("> DB Query Result:");
    print(data);

    // Is an array
    if (data.length > 1) {
      List<Map<String, dynamic>> array = [];
      data.forEach((e) => array.add(e.values.first));
      print("> DB Query RETURN:");
      print(array);
      connection.close();
      return array;
    }

    var item = data.elementAt(0).values.toList().elementAt(0);

    connection.close();
    return item;
  }
}
