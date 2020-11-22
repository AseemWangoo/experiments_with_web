import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({this.color = const Color(0xFFFFFF), @required this.text});

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 63, bottom: 21),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .headline4
            .apply(color: color, fontWeightDelta: 3),
      ),
    );
  }
}
