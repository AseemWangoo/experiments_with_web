import 'package:experiments_with_web/game/game.dart';
import 'package:experiments_with_web/game/utilities/constants.dart';

import 'package:flame/sprite.dart';

import 'package:flutter/material.dart';

class HomeView {
  HomeView({
    @required this.gameTime,
  }) {
    titleRect = Rect.fromLTWH(
        gameTime.screenSize.width / 6,
        gameTime.screenSize.height / 4,
        gameTime.screenSize.width / 1.5,
        gameTime.screenSize.height / 6);

    titleSprite = Sprite(GameUtils.gameName);
  }

  final GameTime gameTime;

  // COMPONENT VARIABLES
  Rect titleRect;
  Sprite titleSprite;

  void render(Canvas c) {
    titleSprite.renderRect(c, titleRect);
  }

  void update(double t) {}
}
