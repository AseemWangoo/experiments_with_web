import 'dart:math';

import 'package:experiments_with_web/game/utilities/constants.dart';
import 'package:flame/flame.dart';

class GameHelpers {
  GameHelpers._();

  static double randomize() {
    final _rnd = Random();
    return _rnd.nextDouble();
  }
}

class AssetsLoader {
  AssetsLoader._();

  static void loadImages() => Flame.images.loadAll(GameUtils.images);
}
