import 'dart:ui';
import 'package:flutter/foundation.dart';

import 'package:experiments_with_web/game/game.dart';

class Virus {
  Virus({
    @required this.boxGame,
    double left,
    double y,
  }) {
    virusRect = Rect.fromLTWH(left, y, boxGame.tileSize, boxGame.tileSize);
    virusPaint = Paint()..color = const Color(0xff6ab04c);
  }

  final BoxGame boxGame;

  // COMPONENT VARIABLES
  Rect virusRect;
  Paint virusPaint;

  void render(Canvas canvas) {
    canvas.drawRect(virusRect, virusPaint);
  }

  void update(double t) {}
}
