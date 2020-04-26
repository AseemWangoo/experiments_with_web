// ignore_for_file: implicit_dynamic_return

import 'package:experiments_with_web/game/utilities/constants.dart';
import 'package:flame/flame.dart';

import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';

import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final _game = BoxGame();

  @override
  Widget build(BuildContext context) => _game.widget;
}

class BoxGame extends Game with TapDetector {
  BoxGame() {
    initialize;
  }

  Size screenSize;
  bool _hasWon = false;
  double tileSize;

  Future<void> get initialize async {
    final _size = await Flame.util.initialDimensions();
    resize(_size);
  }

  @override
  void render(Canvas canvas) {
    // DRAW A FULL SCREEN BOX
    final _bgRect = Rect.fromLTWH(
      0.0,
      0.0,
      screenSize.width,
      screenSize.height,
    );

    final _bgPaint = Paint()..color = const Color(0xFF576574);
    canvas.drawRect(_bgRect, _bgPaint);

    final _screenCenterX = screenSize.width / 2;
    final _screenCenterY = screenSize.height / 2;

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
    screenSize = size;
    tileSize = screenSize.width / GameUtils.screenElementSize;
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

  // We only need to worry about writing the actual update and render processes, rest taken care by Flame.
  @override
  void onTapDown(TapDownDetails details) {
    final _touchPointX = details.globalPosition.dx;
    final _touchPointY = details.globalPosition.dy;

    final _screenCenterX = screenSize.width / 2;
    final _screenCenterY = screenSize.height / 2;

    final _touchedWidth = _isWithinWidth(_touchPointX, _screenCenterX);
    final _touchedHeight = _isWithinHeight(_touchPointY, _screenCenterY);

    if (_touchedWidth && _touchedHeight) {
      _hasWon = true;
    }

    print('TAP DOWN X >>> $_touchPointX Y >>>> $_touchPointY');
    super.onTapDown(details);
  }

  void _winningCondition(Paint boxPaint) {
    if (_hasWon) {
      boxPaint.color = Colors.green;
    } else {
      boxPaint.color = Colors.black;
    }
  }

  bool _isWithinWidth(double dx, double width) {
    bool _touched = false;
    const _boxWidth = GameUtils.boxWidth;

    if (dx >= width - _boxWidth && dx <= width + _boxWidth) {
      _touched = true;
    }
    return _touched;
  }

  bool _isWithinHeight(double dy, double height) {
    bool _touched = false;
    const _boxHeight = GameUtils.boxHeight;

    if (dy >= height - _boxHeight && dy <= height + _boxHeight) {
      _touched = true;
    }

    return _touched;
  }
}
