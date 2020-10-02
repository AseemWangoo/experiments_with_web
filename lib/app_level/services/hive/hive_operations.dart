import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/models/articles/articles.dart';

import 'package:hive/hive.dart';

class HiveOperationsService {
  //
  final _favBox = Hive.box<ArticlesModel>(HiveBoxes.favBox);

  Future<int> addToFavBox(ArticlesModel data) async {
    return _favBox.add(data);
  }

  Box<ArticlesModel> get favBox => _favBox;

  List<ArticlesModel> get fetchFromFavBox => _favBox.values.toList();
}
