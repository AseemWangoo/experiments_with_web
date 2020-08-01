import 'dart:math' as math;

import 'package:flutter/material.dart';

class AseemPainted extends StatefulWidget {
  AseemPainted({Key key}) : super(key: key);

  @override
  _AseemPaintedState createState() => _AseemPaintedState();
}

class _AseemPaintedState extends State<AseemPainted> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black87,
      child: CustomPaint(
        painter: _ThatsAllFolksPainter(),
      ),
    );
  }
}

class _ThatsAllFolksPainter extends CustomPainter {
  const _ThatsAllFolksPainter({this.circles = 6}) : assert(circles >= 1);

  final int circles;
  static const _kColor = Color(0xFF791600);

  @override
  void paint(Canvas canvas, Size size) {
    var _darkPaint = Paint()
      ..color = Colors.black12
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

class PostmanPainter extends CustomPainter {
  double rotationFactor;

  PostmanPainter({this.rotationFactor});

  @override
  void paint(Canvas canvas, Size size) {
    Offset centerOffset = Offset(size.width / 2, size.height / 2);

    Paint innerPaint = Paint()
      ..color = Colors.orange
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    Paint outerPaint = Paint()
      ..color = Colors.orange
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    double rotationAngle = rotationFactor * math.pi;
    double initialDisplacement = 0.75 * math.pi;

    canvas.drawCircle(centerOffset, 20.0, innerPaint);
    canvas.drawCircle(centerOffset, 40.0, outerPaint);
    canvas.drawCircle(centerOffset, 60.0, outerPaint);
    canvas.drawCircle(centerOffset, 80.0, outerPaint);
    canvas.drawCircle(
        Offset(
            size.width / 2 +
                40.0 * math.cos(initialDisplacement + rotationAngle * 4),
            size.height / 2 +
                40.0 * math.sin(initialDisplacement + rotationAngle * 4)),
        6.0,
        innerPaint);
    canvas.drawCircle(
        Offset(
            size.width / 2 +
                60.0 * math.cos(initialDisplacement + rotationAngle * 2),
            size.height / 2 +
                60.0 * math.sin(initialDisplacement + rotationAngle * 2)),
        6.0,
        innerPaint);
    canvas.drawCircle(
        Offset(
            size.width / 2 +
                80.0 * math.cos(initialDisplacement + rotationAngle),
            size.height / 2 +
                80.0 * math.sin(initialDisplacement + rotationAngle)),
        6.0,
        innerPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
