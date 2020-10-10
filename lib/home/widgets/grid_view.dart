import 'package:flutter/material.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({Key key, @required this.children})
      : assert(children != null && children.length > 0),
        super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.8,
      shrinkWrap: true,
      crossAxisCount: 5,
      crossAxisSpacing: 32.0,
      mainAxisSpacing: 16.0,
      padding: const EdgeInsets.all(32.0),
      children: children,
    );
  }
}
