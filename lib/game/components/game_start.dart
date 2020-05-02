import 'package:experiments_with_web/game/game.dart';
import 'package:experiments_with_web/game/utilities/constants.dart';

import 'package:flame/sprite.dart';

import 'package:flutter/material.dart';

class GameStartButton {
  GameStartButton({
    @required this.gameTime,
  }) {
    startRect = Rect.fromLTWH(
        gameTime.screenSize.width / 6,
        gameTime.screenSize.height / 4,
        gameTime.screenSize.width / 1.5,
        gameTime.screenSize.height / 6);

    startSprite = Sprite(GameUtils.playBtn);
  }

  final GameTime gameTime;

  // COMPONENT VARIABLES
  Rect startRect;
  Sprite startSprite;

  void render(Canvas c) {
    startSprite.renderRect(c, startRect);
  }

  void update(double t) {}

  void onTapDown() {}
}
