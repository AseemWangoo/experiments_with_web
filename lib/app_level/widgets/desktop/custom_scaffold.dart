import 'package:experiments_with_web/app_level/extensions/textstyle_extension.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    Key key,
    this.titleText = 'Your Title',
    this.child,
  }) : super(key: key);

  final String titleText;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText, style: const TextStyle().c(Colors.black)),
      ),
      body: child ?? const Center(child: Text('Hi there')),
    );
  }
}
