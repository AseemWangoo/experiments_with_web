import 'package:flutter/material.dart';

class TransformFollower extends StatelessWidget {
  const TransformFollower({
    Key key,
    @required this.child,
    @required this.offset,
    this.link,
  }) : super(key: key);

  final Widget child;
  final LayerLink link;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return CompositedTransformFollower(
      offset: offset,
      link: link,
      showWhenUnlinked: false,
      child: child,
    );
  }
}
