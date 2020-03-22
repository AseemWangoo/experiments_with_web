import 'package:flutter/material.dart' show BuildContext, MediaQuery;

class ScreenQueries {
  ScreenQueries._privateConstructor();

  static final instance = ScreenQueries._privateConstructor();

  /// Get the width...
  double width(BuildContext context) => MediaQuery.of(context).size.width;

  /// Get the height...
  double height(BuildContext context) => MediaQuery.of(context).size.height;

  /// Custom width...
  double customWidth(BuildContext context, double divideBy) =>
      (MediaQuery.of(context).size.width / divideBy).truncateToDouble();

  /// Custom height...
  double customHeight(BuildContext context, double divideBy) =>
      (MediaQuery.of(context).size.height / divideBy).truncateToDouble();

  /// Custom width in percent...
  double customWidthPercent(BuildContext context, double percent) =>
      (MediaQuery.of(context).size.width * percent).truncateToDouble();

  /// Custom height in percent...
  double customHeightPercent(BuildContext context, double percent) =>
      (MediaQuery.of(context).size.height * percent).truncateToDouble();
}
