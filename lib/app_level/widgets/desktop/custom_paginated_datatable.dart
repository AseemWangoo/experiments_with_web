import 'package:flutter/material.dart';

typedef OnRowChange = void Function(int index);

class CustomPaginatedTable extends StatelessWidget {
  const CustomPaginatedTable({
    Key key,
    this.rowsPerPage = PaginatedDataTable.defaultRowsPerPage,
    DataTableSource source,
    List<DataColumn> dataColumns,
    Widget header,
    bool showActions = false,
    List<Widget> actions,
    this.sortColumnIndex,
    this.sortColumnAsc = true,
    this.onRowChanged,
  })  : _source = source,
        _dataColumns = dataColumns,
        _header = header,
        _showActions = showActions,
        _actions = actions,
        assert(
            sortColumnIndex == null ||
                (sortColumnIndex >= 0 && sortColumnIndex < dataColumns.length),
            'Check the sortColumnIndex value'),
        assert(sortColumnAsc != null),
        super(key: key);

  /// This is the source / model which will be binded
  ///
  /// to each item in the Row...
  final DataTableSource _source;

  /// This is the list of columns which will be shown
  ///
  /// at the top of the DataTable.
  final List<DataColumn> _dataColumns;

  final Widget _header;
  final bool _showActions;
  final List<Widget> _actions;
  final int rowsPerPage;
  final int sortColumnIndex;
  final bool sortColumnAsc;

  final OnRowChange onRowChanged;

  DataTableSource get _fetchDataTableSource {
    if (_source != null) {
      return _source;
    }
    return _DefaultSource();
  }

  List<DataColumn> get _fetchDataColumns {
    if (_dataColumns != null) {
      return _dataColumns;
    }
    return _defColumns;
  }

  Widget get _fetchHeader {
    if (_header != null) {
      return _header;
    }

    return const Text('Data with 7 rows per page');
  }

  List<Widget> get _fetchActions {
    if (_showActions && _actions != null) {
      return _actions;
    } else if (!_showActions) {
      return null;
    }

    return _defAction;
  }

  @override
  Widget build(BuildContext context) {
    //
    return Scrollbar(
      child: ConstrainedBox(
        child: PaginatedDataTable(
          actions: _fetchActions,
          columns: _fetchDataColumns,
          header: _fetchHeader,
          onRowsPerPageChanged: onRowChanged,
          rowsPerPage: rowsPerPage,
          source: _fetchDataTableSource,
          sortColumnIndex: sortColumnIndex,
          sortAscending: sortColumnAsc,
        ),
        constraints: const BoxConstraints.expand(width: double.maxFinite),
      ),
    );
  }
}

class SampleSource extends DataTableSource {
  @override
  DataRow getRow(int index) {
    //

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('row #$index')),
        DataCell(Text('name #$index')),
      ],
    );
  }

  @override
  int get rowCount => 10;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}

class _DefaultSource extends DataTableSource {
  @override
  DataRow getRow(int index) => DataRow.byIndex(
        index: index,
        cells: [
          DataCell(Text('row #$index')),
          DataCell(Text('name #$index')),
        ],
      );
  @override
  int get rowCount => 10;
  @override
  bool get isRowCountApproximate => false;
  @override
  int get selectedRowCount => 0;
}

final _defColumns = <DataColumn>[
  const DataColumn(label: Text('row')),
  const DataColumn(label: Text('name')),
];

final _defAction = <Widget>[
  IconButton(
    icon: const Icon(Icons.info_outline),
    onPressed: () {},
  ),
];
