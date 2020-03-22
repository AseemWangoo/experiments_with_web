import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class OptionButton extends StatefulWidget {
  const OptionButton({
    Key key,
    @required this.buttonText,
    @required this.onTap,
  }) : super(key: key);

  ///Specify the button text...
  final String buttonText;

  ///Action on tap of the button....
  final VoidCallback onTap;

  @override
  _OptionButtonState createState() => _OptionButtonState();
}

class _OptionButtonState extends State<OptionButton>
    with TickerProviderStateMixin {
  AnimationController _animControlSatellite;

  Animation<double> _rotateAnimSatellite;

  @override
  void initState() {
    super.initState();

    _animControlSatellite = AnimationController(
      duration: const Duration(seconds: 30),
      vsync: this,
    );

    _rotateAnimSatellite = Tween(begin: 0.0, end: 1.0).animate(
      _animControlSatellite,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animControlSatellite.repeat();
        }
      });

    _animControlSatellite.forward().orCancel;
  }

  @override
  void dispose() {
    _animControlSatellite.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //
    // timeDilation = 2.0;

    return AnimatedBuilder(
      animation: _rotateAnimSatellite,
      builder: (context, child) {
        //

        return CustomPaint(
          child: child,
          foregroundPainter: _CircularPainter(
            indicatorColor: Colors.cyan,
            indicatorPosition: _rotateAnimSatellite.value,
          ),
        );
      },
      child: Container(
        height: 100.0,
        width: 100.0,
        child: RawMaterialButton(
          onPressed: widget.onTap,
          child: Text(
            widget.buttonText,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          shape: const CircleBorder(),
          elevation: 2.0,
          // fillColor: Colors.white,
          padding: const EdgeInsets.all(10.0),
        ),
      ),
    );
  }
}

class _CircularPainter extends CustomPainter {
  _CircularPainter({
    @required Color indicatorColor,
    @required this.indicatorPosition,
    this.trackWidth = 3.0,
    Color trackColor = Colors.green,
    this.strokeWidth = 0.0,
    this.indicatorSize = 15.0,
  })  : trackPaint = Paint()
          ..color = trackColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = trackWidth,
        thumbPaint = Paint()
          ..color = indicatorColor
          ..style = PaintingStyle.fill;

  final double trackWidth;
  final Paint trackPaint;
  final double strokeWidth;
  final double indicatorSize;
  final Paint thumbPaint;
  final double indicatorPosition;

  @override
  void paint(Canvas canvas, Size size) {
    final outerThickness = max(trackWidth, max(strokeWidth, indicatorSize));
    final constrainedSize = Size(
      size.width - outerThickness,
      size.height - outerThickness,
    );

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(constrainedSize.width, constrainedSize.height) / 2;

    // Paint the track for indicator.
    canvas.drawCircle(
      center,
      radius,
      trackPaint,
    );

    // Paint the indicator.
    final thumbAngle = 2 * pi * indicatorPosition - (pi / 2);
    final thumbX = cos(thumbAngle) * radius;
    final thumbY = sin(thumbAngle) * radius;
    final thumbCenter = Offset(thumbX, thumbY) + center;
    final thumbRadius = indicatorSize / 2.0;

    canvas.drawCircle(
      thumbCenter,
      thumbRadius,
      thumbPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
