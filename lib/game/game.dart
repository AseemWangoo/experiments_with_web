import 'package:flame/game/game.dart';

import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final _game = _BoxGame();

  @override
  Widget build(BuildContext context) => _game.widget;
}

class _BoxGame extends Game {
  Size _screenSize;

  @override
  void render(Canvas canvas) {
    final _bgRect = Rect.fromLTWH(
      0.0,
      0.0,
      _screenSize.width,
      _screenSize.height,
    );

    final _bgPaint = Paint()..color = Colors.deepOrange;

    canvas.drawRect(_bgRect, _bgPaint);
  }

  @override
  void update(double t) {}

  @override
  void resize(Size size) {
    _screenSize = size;
    super.resize(size);
  }
}
