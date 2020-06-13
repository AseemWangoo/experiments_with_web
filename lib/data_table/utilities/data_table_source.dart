import 'package:experiments_with_web/data_table/models/user_model.dart';

import 'package:flutter/material.dart';

class UserDataTableSource extends DataTableSource {
  UserDataTableSource({
    @required List<UserModel> userData,
  })  : _userData = userData,
        assert(userData != null);

  final List<UserModel> _userData;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);

    if (index >= _userData.length) {
      return null;
    }
    final _user = _userData[index];

    return DataRow.byIndex(
      index: index, // DONT MISS THIS
      cells: <DataCell>[
        DataCell(Text('${_user.id}')),
        DataCell(Text('${_user.name}')),
        DataCell(Text('${_user.email}')),
        DataCell(Text('${_user.phone}')),
        DataCell(Text('${_user.website}')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _userData.length;

  @override
  int get selectedRowCount => 0;
}
