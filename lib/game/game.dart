// ignore_for_file: implicit_dynamic_return

import 'package:experiments_with_web/app_level/services/local_storage_service.dart';
import 'package:experiments_with_web/game/components/background.dart';
import 'package:experiments_with_web/game/components/display_score.dart';
import 'package:experiments_with_web/game/components/game_instruction.dart';
import 'package:experiments_with_web/game/components/game_start.dart';
import 'package:experiments_with_web/game/components/high_score.dart';
import 'package:experiments_with_web/game/components/moving_dragon_virus.dart';
import 'package:experiments_with_web/game/components/moving_virus.dart';
import 'package:experiments_with_web/game/components/music_options.dart';
import 'package:experiments_with_web/game/components/sfx_options.dart';
import 'package:experiments_with_web/game/components/virus.dart';
import 'package:experiments_with_web/game/controllers/virus_spawner.dart';
import 'package:experiments_with_web/game/utilities/constants.dart';
import 'package:experiments_with_web/game/utilities/helpers.dart';
import 'package:experiments_with_web/game/views/home_view.dart';
import 'package:experiments_with_web/game/views/inst_view.dart';
import 'package:experiments_with_web/game/views/lost_view.dart';
import 'package:experiments_with_web/locator.dart';

import 'package:audioplayers/audioplayers.dart';

import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';

import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key key}) : super(key: key);
  static final _game = GameTime();

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();
    AssetsLoader.loadImages();
  }

  @override
  Widget build(BuildContext context) => GameScreen._game.widget;

  @override
  void dispose() {
    GameScreen._game?.stopMusic();
    super.dispose();
  }
}

class GameTime extends Game with TapDetector {
  GameTime() {
    initialize;
  }

  Size screenSize;
  double tileSize;
  Background background;

  // ADD VIRUS
  List<Virus> virusCmpnt;

  // ADD VIEW
  GameView activeView = GameView.home;
  HomeView homeView;
  LostView lostView;
  InstView instView;
  DisplayScore scoreDisplay;

  // ADD BUTTONS
  GameStartButton startButton;
  GameInstructionButton instButton;

  // CONTROLLERS
  VirusSpawner virusSpawner;

  // SCORE
  int score;

  // STORAGE
  final storageService = locator<LocalStorageService>();
  HighScore highScoreDisplay;

  // SOUNDS
  AudioPlayer playBGM;
  MusicButton bgMusicOption;
  SFXButton sfxMusicOption;

  Future<void> get initialize async {
    virusCmpnt = <Virus>[];
    score = 0;

    final _size = await Flame.util.initialDimensions();
    resize(_size);

    background = Background(gameTime: this);
    startButton = GameStartButton(gameTime: this);
    instButton = GameInstructionButton(gameTime: this);
    scoreDisplay = DisplayScore(gameTime: this);
    highScoreDisplay = HighScore(gameTime: this);

    // AUDIO PLAYERS
    playBGM = await Flame.audio.loopLongAudio(GameUtils.bgMusic, volume: 0.25);
    // ignore: unawaited_futures
    playBGM.pause();
    playBGMusic();

    // CONTROLLERS
    virusSpawner = VirusSpawner(gameTime: this);

    // VIEWS
    homeView = HomeView(gameTime: this);
    lostView = LostView(gameTime: this);
    instView = InstView(gameTime: this);

    // BG MUSIC OPTIONS
    bgMusicOption = MusicButton(gameTime: this);
    sfxMusicOption = SFXButton(gameTime: this);
  }

  @override
  void render(Canvas canvas) {
    // RENDER BACKGROUND
    background.render(canvas);

    // SHOW HIGH SCORE
    highScoreDisplay.render(canvas);

    // DISPLAY SCORE
    if (activeView == GameView.playing) {
      scoreDisplay.render(canvas);
    }

    // LOOP THROUGH VIRUS
    for (final _virus in virusCmpnt) {
      _virus.render(canvas);
    }

    // ADD VIEWS
    if (activeView == GameView.home) {
      homeView.render(canvas);
    }

    if (activeView == GameView.lost) {
      lostView.render(canvas);
    }

    if (activeView == GameView.home || activeView == GameView.lost) {
      startButton.render(canvas);
      instButton.render(canvas);
    }

    // RENDER MUSIC OPTION
    bgMusicOption.render(canvas);
    sfxMusicOption.render(canvas);

    if (activeView == GameView.howToPlay) {
      instView.render(canvas);
    }
  }

  @override
  void update(double t) {
    virusSpawner?.update(t);

    // LOOP THROUGH VIRUS
    for (final _virus in virusCmpnt) {
      _virus.update(t);
    }

    virusCmpnt.removeWhere((_virus) => _virus.isVirusOffScreen);

    // DISPLAY SCORE
    if (activeView == GameView.playing) {
      scoreDisplay.update(t);
    }
  }

  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / GameUtils.screenElementSize;
    super.resize(size);
  }

  @override
  void onTap() {
    print('I WAS TAPPED');
    super.onTap();
  }

  @override
  void onTapUp(TapUpDetails details) {
    print(
      'TAP UP X >>> ${details.globalPosition.dx} Y >>>> ${details.globalPosition.dy}',
    );
    super.onTapUp(details);
  }

  // We only need to worry about writing the actual update and render processes, rest taken care by Flame.
  @override
  void onTapDown(TapDownDetails details) {
    final _touchPointOffset = details.globalPosition;
    print('TAP DOWN OFFSET >>> $_touchPointOffset');
    // FOR START BUTTON TAP...
    // ignore: omit_local_variable_types
    bool _isHandled = false;

    // FOR INST IMAGE
    if (!_isHandled) {
      if (activeView == GameView.howToPlay) {
        activeView = GameView.home;
        _isHandled = true;
      }
    }

    // BG MUSIC OPTION
    if (!_isHandled && bgMusicOption.musicRect.contains(_touchPointOffset)) {
      bgMusicOption.onTapDown();
      _isHandled = true;
    }

    // SFX MUSIC OPTION
    if (!_isHandled && sfxMusicOption.sfxRect.contains(_touchPointOffset)) {
      sfxMusicOption.onTapDown();
      _isHandled = true;
    }

    // FOR START BUTTON
    if (!_isHandled && startButton.startRect.contains(_touchPointOffset)) {
      if (activeView == GameView.home || activeView == GameView.lost) {
        startButton.onTapDown();
        _isHandled = true;
      }
    }

    // FOR THE HELP BUTTON
    if (!_isHandled && instButton.instRect.contains(_touchPointOffset)) {
      if (activeView == GameView.home || activeView == GameView.lost) {
        instButton.onTapDown();
        _isHandled = true;
      }
    }

    // FOR THE START BUTTON
    if (!_isHandled) {
      // IS VIRUS HIT
      // ignore: omit_local_variable_types
      bool _isVirusHit = false;

      for (final _virus in virusCmpnt) {
        if (_virus.virusRect.contains(_touchPointOffset)) {
          _virus.onTapDown();
          _isHandled = true;
          _isVirusHit = true;
        }

        // LOSING CRITERIA
        if (activeView == GameView.playing && !_isVirusHit) {
          // PLAY LAUGH SOUND
          if (sfxMusicOption.isEnabled) {
            Flame.audio.play(GameUtils.laughSound);
          }
          resetBGMusic();

          activeView = GameView.lost;
        }
      }
    }

    super.onTapDown(details);
  }

  void createVirus() {
    final _rndDouble = GameHelpers.randomize();
    final _left =
        _rndDouble * (screenSize.width - (tileSize * GameUtils.maxVirusSize));
    final _top =
        _rndDouble * (screenSize.height - (tileSize * GameUtils.maxVirusSize));

    final _rndNumber = GameHelpers.randomNumber(2);
    switch (_rndNumber) {
      case 0:
        virusCmpnt.add(MovingVirus(this, _left, _top));
        break;
      case 1:
        virusCmpnt.add(MovingDragonVirus(this, _left, _top));
        break;
    }
  }

  void playBGMusic() {
    playBGM.resume();
  }

  void resetBGMusic() {
    playBGM.seek(Duration.zero);
    playBGM.resume();
  }

  void stopMusic() {
    playBGM.stop();
    playBGM.release();
  }
}
