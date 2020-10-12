import 'package:experiments_with_web/app_level/models/cached_searches/cached_searches.dart';
import 'package:flutter/material.dart';

class SearchHistoryDataTable extends DataTableSource {
  SearchHistoryDataTable({
    @required List<CachedSearches> cachedData,
  }) : _cachedData = cachedData;

  final List<CachedSearches> _cachedData;

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
