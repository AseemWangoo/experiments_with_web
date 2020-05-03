import 'package:experiments_with_web/game/utilities/constants.dart';
import 'package:experiments_with_web/game/game.dart';

import 'package:flame/sprite.dart';

import 'package:flutter/material.dart';

class MusicButton {
  MusicButton({
    @required this.gameTime,
  }) {
    musicRect = Rect.fromLTWH(
      gameTime.tileSize * .25,
      gameTime.tileSize * .25,
      gameTime.tileSize,
      gameTime.tileSize,
    );
    enabledSprite = Sprite(GameUtils.enableSound);
    disabledSprite = Sprite(GameUtils.noSound);
  }

  final GameTime gameTime;

  // COMPONENT VARIABLES
  Rect musicRect;
  Sprite enabledSprite;
  Sprite disabledSprite;
  bool isEnabled = true;

  void render(Canvas c) {
    if (isEnabled) {
      enabledSprite.renderRect(c, musicRect);
    } else {
      disabledSprite.renderRect(c, musicRect);
    }
  }

  void onTapDown() {
    if (isEnabled) {
      isEnabled = false;
      gameTime.playBGM.setVolume(0.0);
    } else {
      isEnabled = true;
      gameTime.playBGM.setVolume(0.25);
    }
  }
}
