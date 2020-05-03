import 'package:experiments_with_web/game/utilities/constants.dart';
import 'package:experiments_with_web/game/game.dart';

import 'package:flame/sprite.dart';

import 'package:flutter/material.dart';

class SFXButton {
  SFXButton({
    @required this.gameTime,
  }) {
    sfxRect = Rect.fromLTWH(
      gameTime.tileSize * 1.5,
      gameTime.tileSize * .25,
      gameTime.tileSize,
      gameTime.tileSize,
    );
    enabledSprite = Sprite(GameUtils.sfxEnableSound);
    disabledSprite = Sprite(GameUtils.sfxDisableSound);
  }

  final GameTime gameTime;

  // COMPONENT VARIABLES
  Rect sfxRect;
  Sprite enabledSprite;
  Sprite disabledSprite;
  bool isEnabled = true;

  void render(Canvas c) {
    if (isEnabled) {
      enabledSprite.renderRect(c, sfxRect);
    } else {
      disabledSprite.renderRect(c, sfxRect);
    }
  }

  void onTapDown() => isEnabled = !isEnabled;
}
