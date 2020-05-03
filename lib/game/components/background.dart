import 'package:experiments_with_web/game/game.dart';
import 'package:experiments_with_web/game/utilities/constants.dart';
import 'package:flame/sprite.dart';

import 'package:flutter/material.dart';

class Background {
  Background({
    @required this.gameTime,
  }) {
    bgSprite = Sprite(GameUtils.roomImage);
    // FULL SCREEN RECTANGLE.
    bgRect = Rect.fromLTWH(
      0.0,
      0.0,
      gameTime.screenSize.width,
      gameTime.screenSize.height,
    );
  }
  final GameTime gameTime;

  // COMPONENT VARIABLES
  Rect bgRect;
  Sprite bgSprite;

  void render(Canvas c) {
    // DRAW BG
    bgSprite.renderRect(c, bgRect);
  }

  void update(double t) {}
}
