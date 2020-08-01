import 'package:flutter/material.dart';

class RowSpacer extends StatelessWidget {
  const RowSpacer({
    Key key,
    @required this.children,
    this.spacerWidget = const SizedBox(width: 8),
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
  })  : assert(children.length > 1),
        super(key: key);

  final List<Widget> children;

  final Widget spacerWidget;

  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  final MainAxisSize mainAxisSize;

  @override
  Widget build(BuildContext context) {
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

    return Row(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: mainAxisAlignment,
      children: _spacedChildren,
    );
  }
}
