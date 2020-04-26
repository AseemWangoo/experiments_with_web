import 'dart:ui';

import 'package:experiments_with_web/game/game.dart';

class Virus {
  Virus(this.boxGame, double x, double y) {
    virusRect = Rect.fromLTWH(x, y, boxGame.tileSize, boxGame.tileSize);
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
