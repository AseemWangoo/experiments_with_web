import 'dart:ui' show Rect;

import 'package:experiments_with_web/game/components/virus.dart';
import 'package:experiments_with_web/game/game.dart';
import 'package:experiments_with_web/game/utilities/constants.dart';

import 'package:flame/sprite.dart';

class MovingVirus extends Virus {
  MovingVirus(
    GameTime gameTime,
    double left,
    double top,
  ) : super(gameTime: gameTime) {
    virusRect = Rect.fromLTWH(left, top, gameTime.tileSize, gameTime.tileSize);

    movingVirusSprite = <Sprite>[];
    movingVirusSprite.add(Sprite(GameUtils.virusUp));
    movingVirusSprite.add(Sprite(GameUtils.virusDown));

    deadVirusSprite = Sprite(GameUtils.virusDead);
  }
}
