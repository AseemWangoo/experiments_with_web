import 'package:experiments_with_web/game/game.dart';

import 'package:flutter/material.dart';

class DisplayScore {
  DisplayScore({
    @required this.gameTime,
  }) {
    painter = TextPainter()
      ..textAlign = TextAlign.center
      ..textDirection = TextDirection.ltr;

    textStyle = TextStyle(
      color: Colors.deepOrange,
      fontSize: 90.0,
      shadows: const <Shadow>[
        Shadow(
          blurRadius: 7,
          color: Color(0xff000000),
          offset: Offset(3.0, 3.0),
        ),
      ],
    );

    position = Offset.zero;
  }

  final GameTime gameTime;

  // COMPONENT VARIABLES
  TextPainter painter;
  TextStyle textStyle;
  Offset position;

  void render(Canvas c) => painter.paint(c, position);

  void update(double t) {
    // ignore: deprecated_member_use
    final _text = painter.text ?? '';
    final _gameScore = gameTime.score.toString();

    if (_text != _gameScore) {
      painter.text = TextSpan(text: _gameScore, style: textStyle);
      painter.layout();
      position = Offset(
        (gameTime.screenSize.width / 2) - (painter.width / 2),
        (gameTime.screenSize.height * 0.25) - (painter.height / 2),
      );
    }
  }
}
