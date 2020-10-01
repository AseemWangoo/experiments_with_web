import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/models/articles/articles.dart';

import 'package:hive/hive.dart';

class HiveOperationsService {
  //

  Future<int> addToFavBox(ArticlesModel data) async {
    var _favBox = Hive.box<ArticlesModel>(HiveBoxes.favBox);
    return _favBox.add(data);
  }
}
