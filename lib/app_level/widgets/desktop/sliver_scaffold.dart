import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class SliverScaffold extends StatelessWidget {
  const SliverScaffold({
    Key key,
    @required ScrollController controller,
    @required List<Widget> children,
    @required Widget menu,
    Widget statusBarChild = const Placeholder(),
  })  : _controller = controller,
        _children = children,
        _menu = menu,
        _statusBarChild = statusBarChild,
        super(key: key);

  final ScrollController _controller;
  final List<Widget> _children;
  final Widget _menu;
  final Widget _statusBarChild;

  @override
  Widget build(BuildContext context) {
    //

    return CustomScrollView(
      controller: _controller,
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, int index) => _statusBarChild,
            childCount: 1,
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          floating: true,
          delegate: _SliverDelegate(child: _menu),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, int index) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [..._children],
            ),
            childCount: 1,
          ),
        ),
      ],
    );
  }
}

class SimpleSliverScaffold extends StatelessWidget {
  const SimpleSliverScaffold({
    Key key,
    @required List<Widget> children,
    @required Widget menu,
  })  : _children = children,
        _menu = menu,
        super(key: key);

  final List<Widget> _children;
  final Widget _menu;

  @override
  Widget build(BuildContext context) {
    //

    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          pinned: true,
          floating: true,
          delegate: _SliverDelegate(child: _menu),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, int index) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [..._children],
            ),
            childCount: 1,
          ),
        ),
      ],
    );
  }
}

class _SliverDelegate implements SliverPersistentHeaderDelegate {
  _SliverDelegate({
    this.minHeight = 56.0,
    this.maxHeight = 56.0,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Material(
        child: SizedBox.expand(child: child),
        elevation: 4.0,
      ),
    );
  }

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;
}
