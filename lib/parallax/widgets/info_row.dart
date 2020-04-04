import 'package:experiments_with_web/app_level/assets/assets.dart';
import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/utilities/screen_size.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/column_spacer.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/row_spacer.dart';

import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({Key key}) : super(key: key);

  static final _screenQueries = ScreenQueries.instance;

  @override
  Widget build(BuildContext context) {
    //

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 56.0),
      child: RowSpacer(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacerWidget: const SizedBox(width: 50.0),
        children: <Widget>[
          _InternalColumn(assetName: WebAssets.covidIsolation.assetName),
          _InternalColumn(assetName: WebAssets.covidEssentials.assetName),
          _InternalColumn(assetName: WebAssets.covidFinancials.assetName),
        ],
      ),
    );
  }
}

class _InternalColumn extends StatelessWidget {
  const _InternalColumn({Key key, @required this.assetName})
      : assert(assetName != null),
        super(key: key);

  final String assetName;

  @override
  Widget build(BuildContext context) {
    //
    final _width = InfoRow._screenQueries.customWidthPercent(
      context,
      366 / ApplevelConstants.stdWidth,
    );

    final _height = InfoRow._screenQueries.customHeightPercent(
      context,
      255 / ApplevelConstants.stdHeight,
    );

    return ColumnSpacer(
      spacerWidget: const SizedBox(height: 16.0),
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Image.asset(assetName),
          width: _width,
          height: _height,
          padding: const EdgeInsets.all(40.0),
        ),
        Text('B'),
        Text('C'),
      ],
    );
  }
}
