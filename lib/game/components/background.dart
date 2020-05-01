import 'package:experiments_with_web/game/game.dart';
import 'package:experiments_with_web/game/utilities/constants.dart';
import 'package:flame/sprite.dart';

import 'package:flutter/material.dart';

class Background {
  Background({
    @required this.gameTime,
  }) {
    bgSprite = Sprite(GameUtils.roomImage);
  }
  final GameTime gameTime;

  Sprite bgSprite;

  void render(Canvas c) {}

  void update(double t) {}
}
