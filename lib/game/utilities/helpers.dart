import 'dart:math';

import 'package:experiments_with_web/game/utilities/constants.dart';
import 'package:flame/flame.dart';

class GameHelpers {
  GameHelpers._();

  static double randomize() {
    final _rnd = Random();
    return _rnd.nextDouble();
  }

  static int randomNumber(int maxSize) {
    final _rnd = Random();
    return _rnd.nextInt(maxSize);
  }
}

class AssetsLoader {
  AssetsLoader._();

  static void loadImages() => Flame.images.loadAll(GameUtils.images);

  static void loadSounds() {
    Flame.audio.disableLog();
    Flame.audio.loadAll(GameUtils.sounds);
  }
}
