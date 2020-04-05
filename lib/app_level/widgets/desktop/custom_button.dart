import 'package:experiments_with_web/app_level/extensions/hover_extension.dart';
import 'package:experiments_with_web/app_level/extensions/textstyle_extension.dart';

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    this.name = 'Button',
    this.bgColor = Colors.grey,
    this.outlineColor = Colors.transparent,
    this.textColor = Colors.white,
    this.width = 100.0,
    this.onTap,
    this.style,
    this.padding = const EdgeInsets.all(17.0),
  }) : super(key: key);

  final Color bgColor;

  final Color outlineColor;

  final Color textColor;

  final double width;

  final String name;

  final TextStyle style;

  final void Function() onTap;

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    //

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: outlineColor, width: 1.7),
          color: bgColor,
        ),
        padding: padding,
        width: width,
        child: Center(
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: style ?? Theme.of(context).textTheme.button.c(textColor),
          ),
        ),
      ),
    ).showCursorOnHover;
  }
}
