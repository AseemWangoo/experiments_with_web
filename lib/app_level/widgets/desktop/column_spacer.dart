import 'package:flutter/material.dart';

class ColumnSpacer extends StatelessWidget {
  const ColumnSpacer({
    Key key,
    @required this.children,
    this.spacerWidget = const SizedBox(height: 8.0),
    this.crossAxisAlignment = CrossAxisAlignment.center,
  })  : assert(children.length > 1),
        super(key: key);

  final CrossAxisAlignment crossAxisAlignment;

  final List<Widget> children;

  final Widget spacerWidget;

  @override
  Widget build(BuildContext context) {
    //

    final _spacedChildren = <Widget>[];

    for (var i = 0; i < children.length; i++) {
      if (i == 0) {
        _spacedChildren.add(children[i]);
      } else if (i == children.length - 1) {
        _spacedChildren.add(spacerWidget);
        _spacedChildren.add(children[i]);
      } else {
        _spacedChildren.add(spacerWidget);
        _spacedChildren.add(children[i]);
      }
    }

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: _spacedChildren,
    );
  }
}
