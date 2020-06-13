import 'package:experiments_with_web/app_level/widgets/desktop/custom_paginated_datatable.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_scaffold.dart';
import 'package:experiments_with_web/data_table/models/data_notifier.dart';
import 'package:experiments_with_web/data_table/models/user_model.dart';
import 'package:experiments_with_web/data_table/utilities/constants.dart';
import 'package:experiments_with_web/data_table/utilities/data_table_source.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class DataTableScreen extends StatelessWidget {
  const DataTableScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return CustomScaffold(
      enableDarkMode: true,
      titleText: DataTableConstants.dtTitle,
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

    if (_model.isEmpty) {
      return const SizedBox.shrink();
    }
    final _dtSource = UserDataTableSource(userData: _model);

    return CustomPaginatedTable(
      dataColumns: _colGen(_model, _dtSource, _provider),
      header: const Text(DataTableConstants.users),
      source: _dtSource,
      sortColumnIndex: _provider.sortColumnIndex,
      sortColumnAsc: _provider.sortAscending,
    );
  }

  List<DataColumn> _colGen(
    List<UserModel> data,
    UserDataTableSource _src,
    UserDataNotifier _provider,
  ) {
    return <DataColumn>[
      DataColumn(
        label: Text(DataTableConstants.colID),
        numeric: true,
        tooltip: DataTableConstants.colID,
        onSort: (colIndex, asc) {
          _sort<num>((user) => user.id, colIndex, asc, _src, _provider);
        },
      ),
      DataColumn(
        label: Text(DataTableConstants.colName),
        tooltip: DataTableConstants.colName,
        onSort: (colIndex, asc) {
          _sort<String>((user) => user.name, colIndex, asc, _src, _provider);
        },
      ),
      DataColumn(
        label: Text(DataTableConstants.colEmail),
        tooltip: DataTableConstants.colEmail,
        onSort: (colIndex, asc) {
          _sort<String>((user) => user.email, colIndex, asc, _src, _provider);
        },
      ),
      DataColumn(
        label: Text(DataTableConstants.colPhone),
        tooltip: DataTableConstants.colPhone,
      ),
      DataColumn(
        label: Text(DataTableConstants.colWebsite),
        tooltip: DataTableConstants.colWebsite,
      ),
    ];
  }

  void _sort<T>(
    Comparable<T> Function(UserModel user) getField,
    int colIndex,
    bool asc,
    UserDataTableSource _src,
    UserDataNotifier _provider,
  ) {
    _src.sort<T>(getField, asc);
    _provider.sortAscending = asc;
    _provider.sortColumnIndex = colIndex;
  }
}
