import 'package:experiments_with_web/app_level/utilities/debouncer.dart';
import 'package:experiments_with_web/google/helpers/constants.dart';
import 'package:experiments_with_web/google/helpers/dimensions.dart'
    as dimensions;

import 'package:flutter/material.dart';

class RoundedShape extends StatelessWidget {
  ///Creates the rounded shape widget..
  const RoundedShape({
    Key key,
    @required this.bgColor,
    this.iconColor = Colors.orange,
    this.cursorColor = Colors.black,
    this.textColor = Colors.black,
    this.onChanged,
  }) : super(key: key);

  final Color bgColor;
  final Color iconColor;
  final Color cursorColor;
  final Color textColor;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    //
    final _width = dimensions.width(context);
    final _debouncer = Debouncer();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0.0, 0.5),
              blurRadius: 5.0,
              spreadRadius: 0.3,
            )
          ],
        ),
        width: dimensions.adjustWidth(googleSearchPercent, _width),
        child: TextField(
          cursorColor: cursorColor,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 13.0,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: iconColor,
              size: 18.0,
            ),
          ),
          onChanged: (val) {
            _debouncer.call(() {
              if (onChanged != null) onChanged(val);
            });
          },
          style: TextStyle(color: textColor),
          maxLines: 1,
        ),
      ),
    );
  }
}
