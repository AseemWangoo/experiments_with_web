import 'dart:async';

import 'package:experiments_with_web/data_table/models/user_model.dart';

import 'package:http/http.dart' as http;

const _url = 'https://jsonplaceholder.typicode.com/users';

class DataTableApi {
  DataTableApi._();

  static Future<List<UserModel>> fetchData() async {
    //
    final _completer = Completer<List<UserModel>>();

    try {
      final resp = await http.get(_url);

      if (resp.statusCode == 200) {
        //
        final _data = userModelFromJson(resp.body);
        _completer.complete(_data);
      }
    } catch (exc) {
      _completer.completeError(<UserModel>[]);
    }

    return _completer.future;
  }
}
