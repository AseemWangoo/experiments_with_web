// ignore_for_file: implicit_dynamic_return

import 'package:experiments_with_web/game/components/background.dart';
import 'package:experiments_with_web/game/components/moving_dragon_virus.dart';
import 'package:experiments_with_web/game/components/moving_virus.dart';
import 'package:experiments_with_web/game/components/virus.dart';
import 'package:experiments_with_web/game/utilities/constants.dart';
import 'package:experiments_with_web/game/utilities/helpers.dart';

import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';

import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key key}) : super(key: key);
  static final _game = GameTime();

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();
    AssetsLoader.loadImages();
  }

  @override
  Widget build(BuildContext context) => GameScreen._game.widget;
}

class GameTime extends Game with TapDetector {
  GameTime() {
    initialize;
  }

  Size screenSize;
  double tileSize;
  Background background;

  // ADD VIRUS
  List<Virus> virusCmpnt;

  Future<void> get initialize async {
    virusCmpnt = <Virus>[];

    final _size = await Flame.util.initialDimensions();
    resize(_size);

    background = Background(gameTime: this);
    createVirus();
  }

  @override
  void render(Canvas canvas) {
    // RENDER BACKGROUND
    background.render(canvas);

    // LOOP THROUGH VIRUS
    for (final _virus in virusCmpnt) {
      _virus.render(canvas);
    }
  }

  @override
  void update(double t) {
    // LOOP THROUGH VIRUS
    for (final _virus in virusCmpnt) {
      _virus.update(t);
    }

    virusCmpnt.removeWhere((_virus) => _virus.isVirusOffScreen);
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

    for (final _virus in virusCmpnt) {
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

    final _rndNumber = GameHelpers.randomNumber(2);
    switch (_rndNumber) {
      case 0:
        virusCmpnt.add(MovingVirus(this, _left, _top));
        break;
      case 1:
        virusCmpnt.add(MovingDragonVirus(this, _left, _top));
        break;
    }
  }
}
