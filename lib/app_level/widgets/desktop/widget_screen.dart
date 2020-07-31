import 'package:flutter/material.dart';

class WidgetScreener extends StatelessWidget {
  const WidgetScreener({
    Key key,
    @required this.child,
    this.scrollbarWidth = 20.0,
    this.ratio = 3 / 2,
  }) : super(key: key);

  final Widget child;
  final double ratio;
  final double scrollbarWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        elevation: 4.0,
        child: AspectRatio(
          aspectRatio: ratio,
          child: child,
        ),
      ),
    );
  }
}
