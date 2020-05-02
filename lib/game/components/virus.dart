import 'dart:ui';

import 'package:flame/sprite.dart';

import 'package:flutter/foundation.dart';

import 'package:experiments_with_web/game/game.dart';
import 'package:experiments_with_web/game/utilities/helpers.dart';
import 'package:experiments_with_web/game/utilities/constants.dart';

class Virus {
  Virus({
    @required this.gameTime,
  }) {
    setupVirusLocation;
  }

  final GameTime gameTime;

  // COMPONENT VARIABLES
  Rect virusRect;
  bool isVirusDead = false;
  bool isVirusOffScreen = false;
  List<Sprite> movingVirusSprite;
  Sprite deadVirusSprite;
  double movingSpriteIndex = 0;
  double get virusSpeed => gameTime.tileSize * 3;
  Offset targetVirusLocation;

  void render(Canvas c) {
    final _inflatedRect = virusRect.inflate(14.0);

    if (isVirusDead) {
      deadVirusSprite.renderRect(c, _inflatedRect);
    } else {
      movingVirusSprite[movingSpriteIndex.toInt()].renderRect(c, _inflatedRect);
    }
  }

  void update(double t) {
    if (isVirusDead) {
      final _translateY = gameTime.tileSize * 18 * t;

      virusRect = virusRect.translate(0, _translateY);

      if (virusRect.top > gameTime.screenSize.height) {
        isVirusOffScreen = true;
      }
    } else {
      // FLYING LOGIC
      movingSpriteIndex += 10 * t;
      if (movingSpriteIndex >= 2) {
        movingSpriteIndex -= 2;
      }

      // MOVING LOGIC
      final _virusDistance = virusSpeed * t;
      final _targetOffset =
          targetVirusLocation - Offset(virusRect.left, virusRect.top);

      if (_virusDistance < _targetOffset.distance) {
        final _updateTargetOffset =
            Offset.fromDirection(_targetOffset.direction, _virusDistance);

        virusRect = virusRect.shift(_updateTargetOffset);
      } else {
        virusRect = virusRect.shift(_targetOffset);
        setupVirusLocation;
      }
    }
  }

  // Virus onTapDown..
  // Change color if virus is tapped...
  void onTapDown() {
    isVirusDead = true;

    // ADDS THE VIRUS AGAIN..
    gameTime.createVirus();
  }

  void get setupVirusLocation {
    final _rndDouble = GameHelpers.randomize();

    final _x = _rndDouble *
        (gameTime.screenSize.width -
            (gameTime.tileSize * GameUtils.maxVirusSize));

    final _y = _rndDouble *
        (gameTime.screenSize.height -
            (gameTime.tileSize * GameUtils.maxVirusSize));

    targetVirusLocation = Offset(_x, _y);
  }
}
