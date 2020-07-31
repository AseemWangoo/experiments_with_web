import 'package:experiments_with_web/app_level/utilities/screen_size.dart';
import 'package:flutter/material.dart';

class ItemsScroller extends StatefulWidget {
  const ItemsScroller({Key key, @required this.children})
      : assert(children.length >= 2),
        super(key: key);

  final List<Widget> children;

  @override
  _ItemsScrollerState createState() => _ItemsScrollerState();
}

class _ItemsScrollerState extends State<ItemsScroller> {
  PageController _controller;
  int _currentPageValue = 0;

  bool _pageHasChanged = false;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: 0.65,
      initialPage: _currentPageValue,
    );
  }

  double get _height => ScreenQueries.instance.height(context);
  double get _width => ScreenQueries.instance.width(context);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.1,
      child: PageView.builder(
        controller: _controller,
        itemBuilder: (BuildContext context, int position) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              var result =
                  _pageHasChanged ? _controller.page : _currentPageValue * 1.0;

              var value = result - position;
              value = (1 - (value.abs() * .5)).clamp(0.0, 1.0) as double;

              return Center(
                child: SizedBox(
                  height: Curves.easeOut.transform(value) * _height,
                  width: Curves.easeOut.transform(value) * _width,
                  child: child,
                ),
              );
            },
            child: widget.children[position],
          );
        },
        itemCount: widget.children.length,
        onPageChanged: (value) {
          setState(() {
            _currentPageValue = value;
            _pageHasChanged = true;
          });
        },
        physics: const ClampingScrollPhysics(),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
