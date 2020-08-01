import 'package:experiments_with_web/game/game.dart';

import 'package:flutter/material.dart';

class VirusSpawner {
  VirusSpawner({
    @required this.gameTime,
  }) {
    start();
    gameTime.createVirus();
  }

  final GameTime gameTime;

  final int maxSpawnInterval = 3000;
  final int minSpawnInterval = 250;
  final int intervalChange = 3;
  final int maxVirusesOnScreen = 7;

  // COMPONENT VARIABLES
  int currentInterval;
  int nextSpawn;

  void start() {
    killAll;
    currentInterval = maxSpawnInterval;
    nextSpawn = DateTime.now().millisecondsSinceEpoch + currentInterval;
  }

  void get killAll {
    final _virusCmpnt = gameTime.virusCmpnt;

    for (final _virus in _virusCmpnt) {
      _virus.isVirusDead = true;
    }
  }

  void update(double t) {
    final _currTimestamp = DateTime.now().millisecondsSinceEpoch;
    // ignore: omit_local_variable_types
    int _livingViruses = 0;

    final _virusCmpnt = gameTime.virusCmpnt;

    // INCLUDE THE MAX VIRUSES ON SCREEN
    for (final _virus in _virusCmpnt) {
      if (!_virus.isVirusDead) {
        _livingViruses += 1;
      }
    }

    if (_currTimestamp >= nextSpawn && _livingViruses < maxVirusesOnScreen) {
      gameTime.createVirus();

      if (currentInterval > minSpawnInterval) {
        currentInterval -= intervalChange;
        currentInterval -= (currentInterval * 0.02).toInt();
      }

      nextSpawn = _currTimestamp + currentInterval;
    }
  }
}

// AS THIS IS A CONTROLLER, SO NO RENDER METHOD.....
