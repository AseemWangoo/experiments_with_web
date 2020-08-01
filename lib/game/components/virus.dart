import 'dart:math';
import 'dart:ui';

import 'package:experiments_with_web/game/components/callout.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

import 'package:flutter/foundation.dart';

import 'package:experiments_with_web/game/game.dart';
import 'package:experiments_with_web/game/utilities/helpers.dart';
import 'package:experiments_with_web/game/utilities/constants.dart';

class Virus {
  Virus({
    @required this.gameTime,
  }) {
    callout = CallOut(virus: this);
    setupVirusLocation;
  }

  final GameTime gameTime;

  double get virusSpeed => gameTime.tileSize * 2;

  // COMPONENT VARIABLES
  Rect virusRect;
  bool isVirusDead = false;
  bool isVirusOffScreen = false;
  List<Sprite> movingVirusSprite;
  Sprite deadVirusSprite;
  double movingSpriteIndex = 0;
  Offset targetVirusLocation;

  // TIMER
  CallOut callout;

  void render(Canvas c) {
    final _inflatedRect = virusRect.inflate(virusRect.width / 2);

    if (isVirusDead) {
      deadVirusSprite.renderRect(c, _inflatedRect);
    } else {
      movingVirusSprite[movingSpriteIndex.toInt()].renderRect(c, _inflatedRect);

      // RENDER CALLOUT
      if (gameTime.activeView == GameView.playing) {
        callout.render(c);
      }
    }
  }

  void update(double t) {
    if (isVirusDead) {
      final _translateY = gameTime.tileSize * 18 * t;

      virusRect = virusRect.translate(0, _translateY);

      if (virusRect.top > gameTime.screenSize.height) {
        isVirusOffScreen = true;
      }
    } else {
      // FLYING LOGIC
      movingSpriteIndex += 10 * t;
      while (movingSpriteIndex >= 2) {
        movingSpriteIndex -= 2;
      }

      // MOVING LOGIC
      final _virusDistance = virusSpeed * t;
      final _targetOffset =
          targetVirusLocation - Offset(virusRect.left, virusRect.top);

      if (_virusDistance < _targetOffset.distance) {
        final _updateTargetOffset =
            Offset.fromDirection(_targetOffset.direction, _virusDistance);

        virusRect = virusRect.shift(_updateTargetOffset);
      } else {
        virusRect = virusRect.shift(_targetOffset);
        setupVirusLocation;
      }

      // TIMER LOGIC
      callout.update(t);
    }
  }

  // Virus onTapDown..
  void onTapDown() {
    if (!isVirusDead) {
      // PLAY HIT SOUND
      final _number = (Random().nextInt(2) + 1).toString();
      if (gameTime.sfxMusicOption.isEnabled) {
        Flame.audio.play('sfx/hit' + _number + '.mp3');
      }

      isVirusDead = true;

      if (gameTime.activeView == GameView.playing) {
        gameTime.score += 1;

        // UPDATE HIGH SCORE
        _updateScore(gameTime.score);
      }
    }
  }

  Future<void> _updateScore(int score) async {
    //
    final _service = gameTime.storageService;
    final _scoreStorage = await _service.fetchValue(GameUtils.scoreKey) ?? '0';

    final _scoreInt = int.parse(_scoreStorage);

    if (score > _scoreInt) {
      _service.saveKeyValue(GameUtils.scoreKey, score.toString());
      // ignore: unawaited_futures
      gameTime.highScoreDisplay.updateHighScore;
    }
  }

  void get setupVirusLocation {
    final _rndDouble1 = GameHelpers.randomize();
    final _rndDouble2 = GameHelpers.randomize();

    final _x = _rndDouble1 *
        (gameTime.screenSize.width -
            (gameTime.tileSize * GameUtils.maxVirusSize));

    final _y = _rndDouble2 *
        (gameTime.screenSize.height -
            (gameTime.tileSize * GameUtils.maxVirusSize));

    targetVirusLocation = Offset(_x, _y);
  }
}
