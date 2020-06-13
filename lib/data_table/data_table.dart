import 'package:experiments_with_web/app_level/widgets/desktop/custom_paginated_datatable.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_scaffold.dart';
import 'package:experiments_with_web/data_table/models/data_notifier.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataTableScreen extends StatelessWidget {
  const DataTableScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return CustomScaffold(
      enableDarkMode: true,
      titleText: 'Hands on With DataTable',
      child: ChangeNotifierProvider<UserDataNotifier>(
        create: (_) => UserDataNotifier(),
        child: _InternalWidget(),
      ),
    );
  }
}

class _InternalWidget extends StatelessWidget {
  const _InternalWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final _provider = context.watch<UserDataNotifier>();
    final _model = _provider.userModel;

    print('IM BUILDING ${_model == null}');

    return CustomPaginatedTable();
  }
}
