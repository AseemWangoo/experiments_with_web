import 'package:experiments_with_web/game/game.dart';
import 'package:experiments_with_web/game/utilities/constants.dart';

import 'package:flutter/material.dart';

class HighScore {
  HighScore({
    @required this.gameTime,
  }) {
    painter = TextPainter()
      ..textAlign = TextAlign.center
      ..textDirection = TextDirection.ltr;

    const _shadow = Shadow(
      blurRadius: 3,
      color: Color(0xff000000),
      offset: Offset.zero,
    );

    textStyle = TextStyle(
      color: Colors.deepOrange,
      fontSize: 40.0,
      shadows: List.generate(4, (index) => _shadow),
    );

    position = Offset.zero;

    // UPDATE HIGH SCORE
    updateHighScore;
  }

  final GameTime gameTime;

  // COMPONENT VARIABLES
  TextPainter painter;
  TextStyle textStyle;
  Offset position;

  void render(Canvas c) => painter.paint(c, position);

  Future<void> get updateHighScore async {
    final _score = await gameTime.storageService.fetchValue(
      GameUtils.scoreKey,
    );

    final _gameScore = int.parse(_score ?? '0');

    // SHOW THE HIGH SCORE
    final _text = 'High Score : ${_gameScore.toString()}';
    painter.text = TextSpan(text: _text, style: textStyle);
    painter.layout();

    position = Offset(
      gameTime.screenSize.width - (gameTime.tileSize * 0.25) - painter.width,
      gameTime.tileSize * 0.25,
    );
  }
}
