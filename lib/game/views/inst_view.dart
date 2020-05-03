import 'package:experiments_with_web/game/game.dart';
import 'package:experiments_with_web/game/utilities/constants.dart';

import 'package:flame/sprite.dart';

import 'package:flutter/material.dart';

class InstView {
  InstView({
    @required this.gameTime,
  }) {
    titleInstRect = Rect.fromLTWH(
        gameTime.screenSize.width / 6,
        gameTime.screenSize.height / 10,
        gameTime.screenSize.width / 1.5,
        gameTime.screenSize.height / 1.2);

    titleInstSprite = Sprite(GameUtils.instructions);
  }

  final GameTime gameTime;

  // COMPONENT VARIABLES
  Rect titleInstRect;
  Sprite titleInstSprite;

  void render(Canvas c) {
    titleInstSprite.renderRect(c, titleInstRect);
  }

  void update(double t) {}
}
