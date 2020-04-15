import 'package:flutter/material.dart';

class SubMenuOption extends StatelessWidget {
  ///Creates the option with sub-menu widget
  const SubMenuOption({
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
    //begin...

    return _constructBody(context);
  }

  //Main widget...
  Widget _constructBody(BuildContext context) {
    //Begin...
    const radius = BorderRadius.all(Radius.circular(1.0));

    return Material(
      color: Colors.blue,
      child: InkWell(
        borderRadius: radius,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text(
            optionName,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          actionOnClick(optionName);
        },
      ),
    );
  }
}
