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

  static const String _kFolks = '''"That's all Folks!"''';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _animation = _TextWriter(start: '', end: _kFolks).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (_, child) {
          return CustomPaint(
            painter: _ThatsAllFolksPainter(text: _animation.value),
          );
        },
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
  const _ThatsAllFolksPainter({this.circles = 6, this.text = ''})
      : assert(circles >= 1);

  final String text;
  final int circles;
  static const _kColor = Color(0xFF791600);

  TextStyle get _textStyle => TextStyle(color: Colors.white, fontSize: 60);

  @override
  void paint(Canvas canvas, Size size) {
    var _darkPaint = Paint()
      ..color = Colors.black38
      ..style = PaintingStyle.fill;

    var _centerPos = Offset(size.width / 2, size.height / 2);
    var _centerRadius = size.width / 12;

    // DRAW RINGS
    for (var i = 2; i <= circles; i++) {
      var _radius = i * _centerRadius * 1.0;
      var path = Path();
      path.addOval(
        Rect.fromCircle(center: _centerPos, radius: _radius),
      );
      path.close();

      canvas.drawShadow(path, _kColor, 1.0, false);
    }
    // DRAW INNERMOST CIRCLE
    canvas.drawCircle(_centerPos, _centerRadius, _darkPaint);

    // DRAW TEXT
    final _textSpan = TextSpan(text: text, style: _textStyle);
    final _textPainter = TextPainter(
      text: _textSpan,
      textDirection: TextDirection.ltr,
    );
    final _offset = Offset(size.width / 3.5, size.height / 2.2);

    _textPainter
      ..layout(minWidth: 0, maxWidth: size.width)
      ..paint(canvas, _offset);
  }

  @override
  bool shouldRepaint(_ThatsAllFolksPainter oldDelegate) =>
      text != oldDelegate.text;
}

class _TextWriter extends Tween<String> {
  _TextWriter({String start = '', String end}) : super(begin: start, end: end);

  @override
  String lerp(double t) {
    var _showPortion = (end.length * t).round();
    return end.substring(0, _showPortion);
  }
}
