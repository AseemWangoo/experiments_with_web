// ignore_for_file: implicit_dynamic_return

import 'package:experiments_with_web/game/components/virus.dart';
import 'package:experiments_with_web/game/utilities/constants.dart';
import 'package:experiments_with_web/game/utilities/helpers.dart';

import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';

import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key key}) : super(key: key);
  static final _game = GameTime();

  @override
  Widget build(BuildContext context) => _game.widget;
}

class GameTime extends Game with TapDetector {
  GameTime() {
    initialize;
  }

  Size screenSize;
  double tileSize;

  // ADD VIRUS
  List<Virus> _virusCmpnt;

  Future<void> get initialize async {
    _virusCmpnt = <Virus>[];

    final _size = await Flame.util.initialDimensions();
    resize(_size);

    createVirus();
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

    // LOOP THROUGH VIRUS
    for (final _virus in _virusCmpnt) {
      _virus.render(canvas);
    }
  }

  @override
  void update(double t) {
    // LOOP THROUGH VIRUS
    for (final _virus in _virusCmpnt) {
      _virus.update(t);
    }
  }

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
    final _touchPointOffset = details.globalPosition;
    print('TAP DOWN OFFSET >>> $_touchPointOffset');

    for (final _virus in _virusCmpnt) {
      if (_virus.virusRect.contains(_touchPointOffset)) {
        //
        _virus.onTapDown();
      }
    }

    super.onTapDown(details);
  }

  void createVirus() {
    final _rndDouble = GameHelpers.randomize();
    final _left = _rndDouble * (screenSize.width - tileSize);
    final _top = _rndDouble * (screenSize.height - tileSize);

    final _virusElement = Virus(gameTime: this, left: _left, top: _top);

    _virusCmpnt.add(_virusElement);
  }
}
