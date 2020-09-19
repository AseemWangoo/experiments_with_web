import 'dart:math' as math;

import 'package:experiments_with_web/app_level/assets/assets.dart';
import 'package:experiments_with_web/app_level/styles/colors.dart';
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
    this.minHeight = 56.0,
    this.maxHeight = 56.0,
    this.controller,
  })  : _children = children,
        _menu = menu,
        super(key: key);

  final List<Widget> _children;
  final Widget _menu;
  final double minHeight;
  final double maxHeight;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    //

    return CustomScrollView(
      controller: controller,
      slivers: <Widget>[
        SliverPersistentHeader(
          pinned: true,
          floating: true,
          delegate: _SliverDelegate(
            child: _menu,
            minHeight: minHeight,
            maxHeight: maxHeight,
          ),
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

class SliverAppbarScaffold extends StatelessWidget {
  const SliverAppbarScaffold({
    Key key,
    @required List<Widget> children,
    this.titleWidget = const Text('SliverAppBar'),
    this.expandedHeight = 300.0,
    this.image = WebAssets.homeBg,
  })  : _children = children,
        super(key: key);

  final Widget titleWidget;
  final double expandedHeight;
  final AssetImage image;
  final List<Widget> _children;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          title: titleWidget,
          backgroundColor: AppColors.brandColor,
          expandedHeight: expandedHeight,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              image.assetName,
              fit: BoxFit.cover,
            ),
          ),
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

class SliverPaddingScaffold extends StatelessWidget {
  const SliverPaddingScaffold({
    Key key,
    this.titleWidget = const Text('SliverPadding and SliverToBoxAdapter'),
  }) : super(key: key);

  final Widget titleWidget;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: AppColors.brandColor,
          pinned: false,
          floating: true,
          title: titleWidget,
        ),
        SliverToBoxAdapter(
          child: Container(
            color: const Color(0xFF9b9987),
            height: 300.0,
            child: Center(
              child: Text('SliverToBoxAdapter'),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          sliver: SliverFillRemaining(
            child: Container(
              color: const Color(0xFF442220),
              child: Center(
                child: Text(
                  'SliverFillRemaining',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// **************************** INTERNALS ****************************
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

  @override
  PersistentHeaderShowOnScreenConfiguration get showOnScreenConfiguration =>
      PersistentHeaderShowOnScreenConfiguration();

  @override
  TickerProvider get vsync => null;
}
