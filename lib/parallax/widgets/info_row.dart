import 'package:experiments_with_web/app_level/assets/assets.dart';
import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/extensions/textstyle_extension.dart';
import 'package:experiments_with_web/app_level/utilities/screen_size.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/column_spacer.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/row_spacer.dart';
import 'package:experiments_with_web/parallax/utilities/constants.dart';

import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({
    Key key,
    this.sectionText = 'Section text here',
  }) : super(key: key);

  final String sectionText;

  static final _screenQueries = ScreenQueries.instance;

  @override
  Widget build(BuildContext context) {
    //

    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 56.0),
        child: ColumnSpacer(
          spacerWidget: const SizedBox(height: 20.0),
          children: <Widget>[
            Text(
              sectionText,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headline3.bold.c(Colors.black),
            ),
            RowSpacer(
              spacerWidget: const SizedBox(width: 50.0),
              children: <Widget>[
                Expanded(
                  child: _InternalColumn(
                    assetName: WebAssets.covidIsolation.assetName,
                    title: ParallaxConstants.selfIsolation,
                    subtitle: ParallaxConstants.stayHomeDesc,
                  ),
                ),
                Expanded(
                  child: _InternalColumn(
                    assetName: WebAssets.covidEssentials.assetName,
                    title: ParallaxConstants.essentials,
                    subtitle: ParallaxConstants.essentialsDesc,
                  ),
                ),
                Expanded(
                  child: _InternalColumn(
                    assetName: WebAssets.covidFinancials.assetName,
                    title: ParallaxConstants.finance,
                    subtitle: ParallaxConstants.financeDesc,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InternalColumn extends StatelessWidget {
  const _InternalColumn({
    Key key,
    @required this.assetName,
    this.title = 'Title here',
    this.subtitle = 'Subtitle here',
  })  : assert(assetName != null),
        super(key: key);

  final String assetName;
  final String title;
  final String subtitle;

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

    final _textHeight = InfoRow._screenQueries.customHeightPercent(
      context,
      32 / ApplevelConstants.stdHeight,
    );

    return SizedBox(
      width: _width,
      child: ColumnSpacer(
        spacerWidget: const SizedBox(height: 16.0),
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Image.asset(assetName),
            height: _height,
            width: _width,
            padding: const EdgeInsets.all(40.0),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headline5.bold,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              subtitle,
              style: Theme.of(context).textTheme.subtitle1.bold,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
