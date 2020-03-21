import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  ///Creates the button of screen....
  const CustomButton({
    Key key,
    @required this.optionName,
    @required this.actionOnClick,
  }) : super(key: key);

  ///Specify the option name.
  final String optionName;

  ///When button is tapped...
  final Function(String) actionOnClick;

  @override
  Widget build(BuildContext context) {
    //Begin...

    return RaisedButton(
      child: Text(optionName),
      elevation: 0.0,
      highlightElevation: 0.0,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onPressed: () => actionOnClick(optionName),
      color: Colors.black.withOpacity(0.05),
    );
  }
}
