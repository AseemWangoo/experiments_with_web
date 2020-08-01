enum GameView {
  home,
  playing,
  lost,
  howToPlay,
}

class GameUtils {
  GameUtils._();

  static const String website =
      'https://flatteredwithflutter.com/how-to-create-game-in-flutter-web-using-flame/';
  static const String youtube = 'https://youtu.be/uUVKxa-YrK8';
  static const String medium =
      'https://medium.com/flutterpub/flutter-web-and-flame-5df7772ce226';

  static const int screenElementSize = 27;

  static const List<String> images = [
    roomImage,
    virusDead,
    virusUp,
    virusDown,
    dragonVirusUp,
    dragonVirusDown,
    defeatBtn,
    gameName,
    playBtn,
    restartBtn,
    winBtn,
    instructions,
    instBtn,
    chat,
    noSound,
    enableSound,
    sfxEnableSound,
    sfxDisableSound,
  ];

  static const String roomImage = 'bg/room.png';

  static const String virusUp = 'virus/virus_fly_up.png';
  static const String virusDown = 'virus/virus_fly_down.png';
  static const String virusDead = 'virus/enemy.png';

  static const String dragonVirusUp = 'virus/dragon_fly_up.png';
  static const String dragonVirusDown = 'virus/dragon_fly_down.png';

  static const String defeatBtn = 'ui/defeat_btn.png';
  static const String gameName = 'ui/game_name.png';
  static const String playBtn = 'ui/play_btn.png';
  static const String restartBtn = 'ui/restart_btn.png';
  static const String winBtn = 'ui/win_btn.png';
  static const String instBtn = 'ui/help_btn.png';

  static const String instructions = 'ui/instruction_game.png';

  static const String chat = 'ui/chat.png';
  static const String noSound = 'ui/no_sound.png';
  static const String enableSound = 'ui/sound.png';
  static const String sfxEnableSound = 'ui/sfx_sounds.png';
  static const String sfxDisableSound = 'ui/no_sfx_sound.png';

  static const double maxVirusSize = 1.7;

  static const String scoreKey = 'high_score';

  static const List<String> sounds = [
    hitSound1,
    hitSound2,
    laughSound,
    bgMusic,
  ];

  static const String hitSound1 = 'sfx/hit1.mp3';
  static const String hitSound2 = 'sfx/hit2.mp3';
  static const String laughSound = 'sfx/laugh.mp3';

  static const String bgMusic = 'bgm/bg_music.mp3';
}
