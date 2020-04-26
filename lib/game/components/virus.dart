import 'dart:ui';
import 'package:flutter/foundation.dart';

import 'package:experiments_with_web/game/game.dart';

class Virus {
  Virus({
    @required this.boxGame,
    double left,
    double top,
  }) {
    virusRect = Rect.fromLTWH(left, top, boxGame.tileSize, boxGame.tileSize);
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

  // Virus onTapDown..
  // Change color if virus is tapped...
  void onTapDown() {
    virusPaint.color = const Color(0xffff4757);
  }
}
