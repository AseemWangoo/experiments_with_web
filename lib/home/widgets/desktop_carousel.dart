import 'dart:math' as math;
import 'package:experiments_with_web/app_level/utilities/screen_size.dart';

import 'package:flutter/material.dart';

const _horizontalDesktopPadding = 81.0;
const cardPadding = 15.0;
const _desktopCardsPerPage = 4;

class DesktopCarousel extends StatefulWidget {
  const DesktopCarousel({
    Key key,
    @required this.children,
    this.heightFactor = 0.3,
    this.showNavButtons = true,
  })  : assert(
          heightFactor >= 0 && heightFactor <= 1,
          'HeightFactor should be between 0 and 1',
        ),
        super(key: key);

  final List<Widget> children;
  final double heightFactor;
  final bool showNavButtons;

  @override
  _DesktopCarouselState createState() => _DesktopCarouselState();
}

class _DesktopCarouselState extends State<DesktopCarousel> {
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() => setState(() {}));
  }

  Widget _builder(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: cardPadding,
      ),
      child: widget.children[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    //
    var showPreviousButton = false;
    var showNextButton = true;

    if (_controller.hasClients) {
      showPreviousButton = _controller.offset > 0;
      showNextButton =
          _controller.offset < _controller.position.maxScrollExtent;
    }

    final w = ScreenQueries.instance.width(context);
    final h = ScreenQueries.instance.height(context);

    final totalWidth = w - (_horizontalDesktopPadding - cardPadding) * 2;
    final itemWidth = totalWidth / _desktopCardsPerPage;

    return SizedBox(
      height: h * widget.heightFactor,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: _horizontalDesktopPadding - cardPadding,
            ),
            child: ListView.builder(
              controller: _controller,
              itemExtent: itemWidth,
              itemCount: widget.children.length,
              itemBuilder: (context, index) => _builder(index),
              physics: const _SnappingScrollPhysics(),
              scrollDirection: Axis.horizontal,
            ),
          ),
          if (widget.showNavButtons && showPreviousButton)
            _DesktopPageButton(
              onTap: () {
                _controller.animateTo(
                  _controller.offset - itemWidth,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                );
              },
            ),
          if (widget.showNavButtons && showNextButton)
            _DesktopPageButton(
              isEnd: true,
              onTap: () {
                _controller.animateTo(
                  _controller.offset + itemWidth,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                );
              },
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}

class _DesktopPageButton extends StatelessWidget {
  const _DesktopPageButton({
    Key key,
    this.isEnd = false,
    this.onTap,
  }) : super(key: key);

  final bool isEnd;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    final buttonSize = 58.0;
    final padding = _horizontalDesktopPadding - buttonSize / 2;

    return Align(
      alignment: isEnd
          ? AlignmentDirectional.centerEnd
          : AlignmentDirectional.centerStart,
      child: Container(
        width: buttonSize,
        height: buttonSize,
        margin: EdgeInsetsDirectional.only(
          start: isEnd ? 0 : padding,
          end: isEnd ? padding : 0,
        ),
        child: Material(
          color: Colors.black.withOpacity(0.5),
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: Icon(
              isEnd ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class _SnappingScrollPhysics extends ScrollPhysics {
  const _SnappingScrollPhysics({ScrollPhysics parent}) : super(parent: parent);

  @override
  _SnappingScrollPhysics applyTo(ScrollPhysics ancestor) {
    return _SnappingScrollPhysics(parent: buildParent(ancestor));
  }

  double _getTargetPixels(
    ScrollMetrics position,
    Tolerance tolerance,
    double velocity,
  ) {
    final itemWidth = position.viewportDimension / _desktopCardsPerPage;
    var item = position.pixels / itemWidth;
    if (velocity < -tolerance.velocity) {
      item -= 0.5;
    } else if (velocity > tolerance.velocity) {
      item += 0.5;
    }
    return math.min(
      item.roundToDouble() * itemWidth,
      position.maxScrollExtent,
    );
  }

  @override
  Simulation createBallisticSimulation(
    ScrollMetrics position,
    double velocity,
  ) {
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent)) {
      return super.createBallisticSimulation(position, velocity);
    }
    final tolerance = this.tolerance;
    final target = _getTargetPixels(position, tolerance, velocity);
    if (target != position.pixels) {
      return ScrollSpringSimulation(
        spring,
        position.pixels,
        target,
        velocity,
        tolerance: tolerance,
      );
    }
    return null;
  }

  @override
  bool get allowImplicitScrolling => true;
}
