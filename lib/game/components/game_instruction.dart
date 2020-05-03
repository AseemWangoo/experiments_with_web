import 'package:experiments_with_web/game/game.dart';
import 'package:experiments_with_web/game/utilities/constants.dart';

import 'package:flame/sprite.dart';

import 'package:flutter/material.dart';

class GameInstructionButton {
  GameInstructionButton({
    @required this.gameTime,
  }) {
    instRect = Rect.fromLTWH(
        gameTime.screenSize.width / 2.5,
        gameTime.screenSize.height / 1.6,
        gameTime.screenSize.width / 5,
        gameTime.screenSize.height / 18);

    instSprite = Sprite(GameUtils.instBtn);
  }

  final GameTime gameTime;

  // COMPONENT VARIABLES
  Rect instRect;
  Sprite instSprite;

  void render(Canvas c) {
    instSprite.renderRect(c, instRect);
  }

  void onTapDown() {
    gameTime.activeView = GameView.howToPlay;
  }
}
