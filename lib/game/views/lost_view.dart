import 'package:experiments_with_web/game/game.dart';
import 'package:experiments_with_web/game/utilities/constants.dart';

import 'package:flame/sprite.dart';

import 'package:flutter/material.dart';

class LostView {
  LostView({
    @required this.gameTime,
  }) {
    titleLostRect = Rect.fromLTWH(
        gameTime.screenSize.width / 6,
        gameTime.screenSize.height / 4,
        gameTime.screenSize.width / 1.5,
        gameTime.screenSize.height / 6);

    titleLostSprite = Sprite(GameUtils.defeatBtn);
  }

  final GameTime gameTime;

  // COMPONENT VARIABLES
  Rect titleLostRect;
  Sprite titleLostSprite;

  void render(Canvas c) {
    titleLostSprite.renderRect(c, titleLostRect);
  }

  void update(double t) {}
}
