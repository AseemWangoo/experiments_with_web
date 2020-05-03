import 'package:experiments_with_web/game/components/virus.dart';
import 'package:experiments_with_web/game/utilities/constants.dart';

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
      color: Colors.black,
      fontSize: 15,
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
      value = value - 0.5 * t;

      if (value <= 0) {
        virus.gameTime.activeView = GameView.lost;
      }
    }

    // CREATE THE CALLOUT RECT
    callOutRect = Rect.fromLTWH(
      virus.virusRect.left,
      virus.virusRect.top,
      virus.gameTime.tileSize,
      virus.gameTime.tileSize,
    );

    // SHOW THE CALLOUT VALUE
    final _text = (value * 10).toInt().toString();
    cPainter.text = TextSpan(text: _text, style: cTextStyle);
    cPainter.layout();

    cPosition = Offset(callOutRect.center.dx, callOutRect.top);
  }
}
