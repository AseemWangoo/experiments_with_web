import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key key,
    @required this.child,
    this.showPadding = true,
  }) : super(key: key);

  final Widget child;
  final bool showPadding;

  @override
  Widget build(BuildContext context) {
    var _child = child;

    if (showPadding) {
      _child = Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
        child: child,
      );
    } else {
      _child = Padding(
        padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 16.0),
        child: child,
      );
    }

    return Dialog(
      elevation: 8.0,
      insetAnimationCurve: Curves.easeInOut,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: _child,
    );
  }
}

class CloseIcon extends StatelessWidget {
  const CloseIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, right: 16.0),
          child: Icon(
            Icons.close,
            size: 16.0,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        onTap: () => Navigator.of(context).pop(),
      ),
    );
  }
}
