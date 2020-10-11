import 'package:experiments_with_web/app_level/utilities/debouncer.dart';
import 'package:experiments_with_web/google/helpers/constants.dart';
import 'package:experiments_with_web/google/helpers/dimensions.dart'
    as dimensions;

import 'package:flutter/material.dart';

class RoundedShape extends StatefulWidget {
  ///Creates the rounded shape widget..
  const RoundedShape({
    Key key,
    @required this.bgColor,
    this.iconColor = Colors.white,
    this.cursorColor = Colors.white,
    this.textColor = Colors.white,
    this.onChanged,
    this.focusNode,
    this.initialValue = '',
    this.textController,
  }) : super(key: key);

  final Color bgColor;
  final Color iconColor;
  final Color cursorColor;
  final Color textColor;
  final ValueChanged<String> onChanged;
  final FocusNode focusNode;
  final String initialValue;
  final TextEditingController textController;

  String get _initValue => initialValue;

  TextEditingController get _widgetTextController => _textController;
  TextEditingController get _textController {
    if (textController != null) {
      return textController;
    }
    return null;
  }

  @override
  _RoundedShapeState createState() => _RoundedShapeState();
}

class _RoundedShapeState extends State<RoundedShape> {
  FocusNode get _focusNode => _checkFocusNode;

  FocusNode get _checkFocusNode => widget.focusNode;
  final _debouncer = Debouncer();
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget._initValue);
  }

  @override
  Widget build(BuildContext context) {
    //
    final _width = dimensions.width(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Container(
        decoration: BoxDecoration(
          color: widget.bgColor,
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
          controller: widget._widgetTextController ?? _textController,
          cursorColor: widget.cursorColor,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 13.0,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: widget.iconColor,
              size: 18.0,
            ),
          ),
          focusNode: _focusNode,
          onChanged: (val) {
            _debouncer.call(() {
              if (widget.onChanged != null) widget.onChanged(val);
            });
          },
          style: TextStyle(color: widget.textColor),
          maxLines: 1,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController?.dispose();
    super.dispose();
  }
}
