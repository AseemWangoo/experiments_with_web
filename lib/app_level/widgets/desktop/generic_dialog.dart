import 'package:flutter/material.dart';

class GenericDialog extends StatelessWidget {
  const GenericDialog({
    @required this.children,
    Key key,
  })  : assert(children != null),
        super(key: key);

  ///Widgets to show...
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 8.0,
      insetAnimationCurve: Curves.easeInOut,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [...children],
        ),
      ),
    );
  }
}
