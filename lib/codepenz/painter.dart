import 'dart:math' as math;

import 'package:flutter/material.dart';

class AseemPainted extends StatefulWidget {
  AseemPainted({Key key}) : super(key: key);

  @override
  _AseemPaintedState createState() => _AseemPaintedState();
}

class _AseemPaintedState extends State<AseemPainted>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation<String> _animation;

  static const String _kFolks = "That's all Folks!";

  TextStyle get _textStyle =>
      Theme.of(context).textTheme.headline1.copyWith(color: Colors.white);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _animation = _TextWriter(start: '', end: _kFolks).animate(
      CurvedAnimation(parent: _controller, curve: Curves.decelerate),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: CustomPaint(
        painter: _ThatsAllFolksPainter(),
        child: AnimatedBuilder(
          animation: _animation,
          builder: (_, child) {
            return Center(
              child: Text(
                '${_animation.value}',
                style: _textStyle,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}

class _ThatsAllFolksPainter extends CustomPainter {
  const _ThatsAllFolksPainter({this.circles = 6}) : assert(circles >= 1);

  final int circles;
  static const _kColor = Color(0xFF791600);

  @override
  void paint(Canvas canvas, Size size) {
    var _darkPaint = Paint()
      ..color = Colors.black38
      ..style = PaintingStyle.fill;

    var _centerPos = Offset(size.width / 2, size.height / 2);
    var _centerRadius = size.width / 12;

    for (var i = 2; i <= circles; i++) {
      //
      var _radius = i * _centerRadius * 1.0;

      var path = Path();
      path.addOval(
        Rect.fromCircle(center: _centerPos, radius: _radius),
      );
      path.close();

      canvas.drawShadow(path, _kColor, 1.0, false);
    }

    canvas.drawCircle(_centerPos, _centerRadius, _darkPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class _TextWriter extends Tween<String> {
  _TextWriter({String start = '', String end}) : super(begin: start, end: end);

  @override
  String lerp(double t) {
    var _showPortion = (end.length * t).round();
    return end.substring(0, _showPortion);
  }
}
