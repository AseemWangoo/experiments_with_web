import 'package:experiments_with_web/app_level/models/cached_searches/cached_searches.dart';
import 'package:experiments_with_web/app_level/services/searches/search_operations.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_paginated_datatable.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_scaffold.dart';
import 'package:experiments_with_web/locator.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'utils/constants.dart';

class SearchHistory extends StatelessWidget {
  const SearchHistory({Key key}) : super(key: key);
  static final _searchOps = locator<SearchOperations>();

  @override
  Widget build(BuildContext context) {
    //
    return CustomScaffold(
      enableDarkMode: true,
      titleText: SearchHistoryConsts.dtTitle,
      child: ValueListenableBuilder(
        builder: (_, Box<CachedSearches> model, child) {
          return CustomPaginatedTable(
            header: const Text(SearchHistoryConsts.users),
          );
        },
        valueListenable: _searchOps.cacheSearchBox.listenable(),
      ),
    );
  }
}
