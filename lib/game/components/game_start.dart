import 'package:experiments_with_web/game/game.dart';
import 'package:experiments_with_web/game/utilities/constants.dart';

import 'package:flame/sprite.dart';

import 'package:flutter/material.dart';

class GameStartButton {
  GameStartButton({
    @required this.gameTime,
  }) {
    startRect = Rect.fromLTWH(
        gameTime.screenSize.width / 3,
        gameTime.screenSize.height / 2.2,
        gameTime.screenSize.width / 2.5,
        gameTime.screenSize.height / 12);

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

  void onTapDown() {
    gameTime.activeView = GameView.playing;
  }
}
