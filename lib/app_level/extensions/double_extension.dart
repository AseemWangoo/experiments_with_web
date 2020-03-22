import 'package:flutter/material.dart' show BuildContext, MediaQuery;

extension Media on double {
  double width(BuildContext context) => MediaQuery.of(context).size.width;

  double height(BuildContext context) => MediaQuery.of(context).size.height;
}
