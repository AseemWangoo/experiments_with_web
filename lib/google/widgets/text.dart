import 'package:experiments_with_web/google/helpers/constants.dart';

import 'package:flutter/material.dart';

class GoogleText extends StatelessWidget {
  const GoogleText({
    Key key,
    @required this.optionName,
    this.fontStyle = fontArial,
    this.color = Colors.black87,
  }) : super(key: key);

  ///Specify the option name.
  final String optionName;

  ///Specify fontStyle
  final String fontStyle;

  ///Specify color
  final Color color;

  @override
  Widget build(BuildContext context) {
    //begin...

    return _constructBody(context);
  }

  //Main widget...
  Widget _constructBody(BuildContext context) {
    //Begin...

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: Text(
          optionName,
          style: TextStyle(
            color: color,
            fontFamily: fontStyle,
          ),
        ),
      ),
    );
  }
}
