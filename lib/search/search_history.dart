import 'package:experiments_with_web/app_level/models/cached_searches/cached_searches.dart';
import 'package:experiments_with_web/app_level/services/searches/search_operations.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_paginated_datatable.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_scaffold.dart';
import 'package:experiments_with_web/locator.dart';
import 'package:experiments_with_web/search/utils/dt_source.dart';

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
          final dtSource = SearchHistoryDataTable(
            cachedData: model.values.toList(),
            onRowSelect: (searchData) =>
                _searchOps.clearItemInCache(searchData),
          );

          return CustomPaginatedTable(
            actions: [
              ElevatedButton.icon(
                onPressed: () => _searchOps.clearEntireCache,
                icon: const Icon(Icons.clear_all),
                label: const Text(SearchHistoryConsts.clearSearch),
              ),
            ],
            dataColumns: _colGen(),
            header: const Text(SearchHistoryConsts.users),
            showActions: true,
            source: dtSource,
          );
        },
        valueListenable: _searchOps.cacheSearchBox.listenable(),
      ),
    );
  }

  List<DataColumn> _colGen() => <DataColumn>[
        DataColumn(
          label: Text(SearchHistoryConsts.colOccurence),
          numeric: true,
        ),
        DataColumn(label: Text(SearchHistoryConsts.colPhrase)),
        DataColumn(label: Text(SearchHistoryConsts.colArticleName)),
        DataColumn(label: Text(SearchHistoryConsts.colTimestamp)),
        DataColumn(label: Text(SearchHistoryConsts.colRemove)),
      ];
}
