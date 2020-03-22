import 'package:flutter/material.dart';

class WebBottomSheet extends StatelessWidget {
  const WebBottomSheet({Key key, @required this.child, this.height = 100.0})
      : super(key: key);

  final Widget child;

  final double height;

  @override
  Widget build(BuildContext context) {
    //

    return Container(
      margin: const EdgeInsets.only(top: 1.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black12, spreadRadius: 10),
        ],
      ),
      height: height,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: child,
      ),
    );
  }
}
