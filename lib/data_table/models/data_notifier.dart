import 'package:experiments_with_web/data_table/api/dt_api.dart';
import 'package:experiments_with_web/data_table/models/user_model.dart';

import 'package:flutter/foundation.dart';

class UserDataNotifier with ChangeNotifier {
  UserDataNotifier() {
    fetchData();
  }

  List<UserModel> get userModel => _userModel;

  // SORT COLUMN INDEX...

  int get sortColumnIndex => _sortColumnIndex;

  set sortColumnIndex(int sortColumnIndex) {
    _sortColumnIndex = sortColumnIndex;
    notifyListeners();
  }

  // SORT ASCENDING....

  bool get sortAscending => _sortAscending;

  set sortAscending(bool sortAscending) {
    _sortAscending = sortAscending;
    notifyListeners();
  }

  // -------------------------------------- INTERNALS --------------------------------------------

  var _userModel = <UserModel>[];

  int _sortColumnIndex;
  bool _sortAscending = true;

  Future<void> fetchData() async {
    _userModel = await DataTableApi.fetchData();
    notifyListeners();
  }
}
