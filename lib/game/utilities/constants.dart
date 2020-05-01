class GameUtils {
  GameUtils._();

  static const int screenElementSize = 27;

  static const List<String> images = [
    roomImage,
    virusDead,
    virusUp,
    virusDown,
  ];

  static const String roomImage = 'bg/room.png';
  static const String virusUp = 'virus/virus_fly_up.png';
  static const String virusDown = 'virus/virus_fly_down.png';
  static const String virusDead = 'virus/enemy.png';
}
