import 'package:experiments_with_web/game/components/virus.dart';
import 'package:experiments_with_web/game/utilities/constants.dart';

import 'package:flame/flame.dart';

import 'package:flame/sprite.dart';

import 'package:flutter/material.dart';

class CallOut {
  CallOut({
    @required this.virus,
  }) {
    value = 1;

    cPainter = TextPainter()
      ..textAlign = TextAlign.center
      ..textDirection = TextDirection.ltr;

    cTextStyle = TextStyle(
      color: Colors.deepOrange,
      fontWeight: FontWeight.bold,
      fontSize: 18.0,
    );

    calloutSprite = Sprite(GameUtils.chat);
  }

  final Virus virus;

  // COMPONENT VARIABLES
  double value;

  Rect callOutRect;
  Sprite calloutSprite;
  TextPainter cPainter;
  TextStyle cTextStyle;
  Offset cPosition;

  void render(Canvas c) {
    calloutSprite.renderRect(c, callOutRect);
    cPainter.paint(c, cPosition);
  }

  void update(double t) {
    // IF VALUE BECOMES LESS OR EQUAL TO ZERO, YOU LOSE
    if (virus.gameTime.activeView == GameView.playing) {
      value = (value - 0.5 * t) + (value / 8) - (value / 7);

      if (value <= 0) {
        // PLAY LAUGH SOUND
        if (virus.gameTime.sfxMusicOption.isEnabled) {
          Flame.audio.play(GameUtils.laughSound);
        }
        virus.gameTime.resetBGMusic();

        virus.gameTime.activeView = GameView.lost;
      }
    }

    // CREATE THE CALLOUT RECT
    callOutRect = Rect.fromLTWH(
      virus.virusRect.left - (virus.gameTime.tileSize * 0.05),
      virus.virusRect.top - (virus.gameTime.tileSize * 0.85),
      virus.gameTime.tileSize * 0.75,
      virus.gameTime.tileSize * 0.75,
    );

    // SHOW THE CALLOUT VALUE
    final _text = (value * 10).toInt().toString();
    cPainter.text = TextSpan(text: _text, style: cTextStyle);
    cPainter.layout();

    cPosition = Offset(callOutRect.center.dx, callOutRect.top);
  }
}
