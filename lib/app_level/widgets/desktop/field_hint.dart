import 'package:flutter/material.dart';

class FieldHint extends StatelessWidget {
  const FieldHint({
    Key key,
    @required this.child,
    this.hintText = 'Some hint here',
  })  : assert(child != null),
        super(key: key);

  final String hintText;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[child, Text(hintText)],
    );
  }
}
