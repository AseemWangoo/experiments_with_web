import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/models/articles/articles.dart';
import 'package:experiments_with_web/app_level/models/cached_searches/cached_searches.dart';

import 'package:hive/hive.dart';

class HiveHelpers {
  HiveHelpers._();

  static void registerAdapters() {
    //
    Hive.registerAdapter<ArticlesModel>(ArticlesModelAdapter());
    Hive.registerAdapter<CachedSearches>(CachedSearchesAdapter());
  }

  static Future<void> openFavoritesBox() async {
    await Hive.openBox<ArticlesModel>(HiveBoxes.favBox);
  }

  static Future<void> openBoxes() async {
    await Hive.openBox<CachedSearches>(HiveBoxes.searchesBox);
  }
}
