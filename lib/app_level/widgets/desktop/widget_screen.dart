import 'package:experiments_with_web/app_level/utilities/screen_size.dart';

import 'package:flutter/material.dart';

class WidgetScreener extends StatefulWidget {
  const WidgetScreener({
    Key key,
    @required this.child,
    this.scrollbarWidth = 20.0,
  }) : super(key: key);

  final Widget child;

  final double scrollbarWidth;

  @override
  _WidgetScreenerState createState() => _WidgetScreenerState();
}

class _WidgetScreenerState extends State<WidgetScreener> {
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        elevation: 4.0,
        child: AspectRatio(
          aspectRatio: 3 / 2,
          child: widget.child,
        ),
      ),
    );
  }
}

class _CustomScrollBar extends StatelessWidget {
  const _CustomScrollBar({
    Key key,
    this.controller,
    this.scrollbarWidth = 20.0,
  }) : super(key: key);

  final double scrollbarWidth;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final _height = ScreenQueries.instance.height(context);
    final _width = ScreenQueries.instance.width(context);

    return Container(
      alignment: Alignment.centerRight,
      color: Colors.yellow,
      height: _height,
      margin: EdgeInsets.only(left: _width - scrollbarWidth),
      width: scrollbarWidth,
      child: Container(
        alignment: Alignment.topCenter,
        child: GestureDetector(
          child: Container(
            height: 40.0,
            width: 15.0,
            child: Text('Hii'),
          ),
        ),
      ),
    );
  }
}
