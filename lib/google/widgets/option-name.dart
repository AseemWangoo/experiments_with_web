import 'package:experiments_with_web/google/helpers/constants.dart';

import 'package:flutter/material.dart';

class OptionWidget extends StatelessWidget {
  ///Creates the option widget
  const OptionWidget({
    Key key,
    this.isText = true,
    @required this.optionName,
    @required this.actionOnClick,
    this.fontStyle = fontArial,
    this.color = Colors.black87,
  }) : super(key: key);

  ///If the option is text.
  final bool isText;

  ///Specify the option name.
  final String optionName;

  ///When button is tapped...
  final Function(String) actionOnClick;

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

    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Center(
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
      ),
      onTap: () => actionOnClick(optionName),
    );
  }
}
