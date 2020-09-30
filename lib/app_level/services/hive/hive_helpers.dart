import 'package:experiments_with_web/app_level/models/favorites/favorites.dart';
import 'package:hive/hive.dart';

class HiveHelpers {
  HiveHelpers._();

  static void registerAdapters() {
    //
    Hive.registerAdapter<FavoritesModel>(FavoritesModelAdapter());
  }
}
