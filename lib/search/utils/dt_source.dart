import 'package:experiments_with_web/app_level/models/cached_searches/cached_searches.dart';

import 'package:flutter/material.dart';

typedef OnRowSelect = void Function(CachedSearches data);

class SearchHistoryDataTable extends DataTableSource {
  SearchHistoryDataTable({
    @required List<CachedSearches> cachedData,
    @required this.onRowSelect,
  }) : _cachedData = cachedData;

  final List<CachedSearches> _cachedData;
  final OnRowSelect onRowSelect;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);

    if (index >= _cachedData.length) {
      return null;
    }

    final searchItem = _cachedData[index];

    return DataRow.byIndex(
      cells: <DataCell>[
        DataCell(Text(searchItem.occurences.toString())),
        DataCell(Text(searchItem.phrase)),
        DataCell(Text(searchItem.articleName)),
        DataCell(Text(searchItem.timestamp.toIso8601String())),
        DataCell(
          IconButton(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: const Icon(Icons.clear),
            onPressed: () => onRowSelect(searchItem),
          ),
        ),
      ],
      index: index,
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _cachedData.length;

  @override
  int get selectedRowCount => 0;
}
