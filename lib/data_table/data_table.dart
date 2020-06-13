import 'package:experiments_with_web/app_level/widgets/desktop/custom_paginated_datatable.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_scaffold.dart';

import 'package:flutter/material.dart';

class DataTableScreen extends StatelessWidget {
  const DataTableScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return CustomScaffold(
      titleText: 'Hands on With DataTable',
      child: CustomPaginatedTable(),
    );
  }
}
