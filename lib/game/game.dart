import 'package:experiments_with_web/game/utilities/constants.dart';
import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';

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

class _BoxGame extends Game with TapDetector {
  Size _screenSize;
  bool _hasWon = false;

  @override
  void render(Canvas canvas) {
    // DRAW A FULL SCREEN BOX
    final _bgRect = Rect.fromLTWH(
      0.0,
      0.0,
      _screenSize.width,
      _screenSize.height,
    );

    final _bgPaint = Paint()..color = Colors.indigo;
    canvas.drawRect(_bgRect, _bgPaint);

    final _screenCenterX = _screenSize.width / 2;
    final _screenCenterY = _screenSize.height / 2;

    final _boxRect = Rect.fromLTWH(
      _screenCenterX - GameUtils.boxLeftPos,
      _screenCenterY - GameUtils.boxRightPos,
      GameUtils.boxWidth,
      GameUtils.boxHeight,
    );

    final _boxPaint = Paint();
    _winningCondition(_boxPaint);

    canvas.drawRect(_boxRect, _boxPaint);
  }

  @override
  void update(double t) {}

  @override
  void resize(Size size) {
    _screenSize = size;
    super.resize(size);
  }

  @override
  void onTap() {
    print('I WAS TAPPED');
    super.onTap();
  }

  @override
  void onTapUp(TapUpDetails details) {
    print(
      'TAP UP X >>> ${details.globalPosition.dx} Y >>>> ${details.globalPosition.dy}',
    );
    super.onTapUp(details);
  }

  @override
  void onTapDown(TapDownDetails details) {
    print(
      'TAP DOWN X >>> ${details.globalPosition.dx} Y >>>> ${details.globalPosition.dy}',
    );
    super.onTapDown(details);
  }

  void _winningCondition(Paint boxPaint) {
    if (_hasWon) {
      boxPaint.color = Colors.green;
    } else {
      boxPaint.color = Colors.black;
    }
  }
}
