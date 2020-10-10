import 'package:flutter/material.dart';

class SpacerView extends StatelessWidget {
  const SpacerView({
    Key key,
    @required this.child,
    this.flex = 5,
  }) : super(key: key);

  final Widget child;
  final int flex;

  @override
  Widget build(BuildContext context) {
    //

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Spacer(flex: flex),
        Expanded(child: child, flex: 16 - (2 * flex)),
        Spacer(flex: flex),
      ],
    );
  }
}
