import 'package:experiments_with_web/app_level/extensions/textstyle_extension.dart';
import 'package:experiments_with_web/app_level/utilities/screen_size.dart';
import 'package:experiments_with_web/data_table/models/user_model.dart';
import 'package:experiments_with_web/data_table/utilities/constants.dart';

import 'package:flutter/material.dart';

class OtherDetails extends StatelessWidget {
  const OtherDetails({Key key, @required this.data})
      : assert(data != null),
        super(key: key);

  final UserModel data;

  Iterable<MapEntry<String, String>> get _fieldValues =>
      _onGenerateFields(data).entries;

  @override
  Widget build(BuildContext context) {
    //

    final _width = ScreenQueries.instance.width(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CloseButton(),
        for (final _fieldValue in _fieldValues) ...[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: _width * 0.1,
                  child: Text(_fieldValue.key),
                ),
                SizedBox(
                  width: _width * 0.1,
                  child: Text(
                    _fieldValue.value,
                    style: const TextStyle().bold,
                  ),
                )
              ],
            ),
          ),
        ],
      ],
    );
  }

  Map<String, String> _onGenerateFields(UserModel data) {
    final _fieldValues = {
      DataTableConstants.colID: data.id.toString(),
      DataTableConstants.colName: data.name,
      DataTableConstants.city: data.address.city,
      DataTableConstants.street: data.address.street,
      DataTableConstants.suite: data.address.suite,
      DataTableConstants.zipcode: data.address.zipcode,
      DataTableConstants.coords:
          '${data.address.geo.lat}, ${data.address.geo.lng}',
    };

    return _fieldValues;
  }
}
