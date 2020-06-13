import 'package:experiments_with_web/data_table/api/dt_api.dart';
import 'package:experiments_with_web/data_table/models/user_model.dart';

import 'package:flutter/foundation.dart';

class UserDataNotifier with ChangeNotifier {
  UserDataNotifier() {
    fetchData();
  }

  UserModel get userModel => _userModel;

  // -------------------------------------- INTERNALS --------------------------------------------

  var _userModel = UserModel();

  Future<void> fetchData() async {
    _userModel = await DataTableApi.fetchData();
    notifyListeners();
  }
}
