import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/models/articles/articles.dart';

import 'package:hive/hive.dart';

class HiveOperationsService {
  //
  final _favBox = Hive.box<ArticlesModel>(HiveBoxes.favBox);

  Future<void> addToFavBox(ArticlesModel data) async {
    return _favBox.put(data.articleID, data);
  }

  Future<void> addBulkToFavBox(ArticlesModel data) async {
    final _insertMap = <String, ArticlesModel>{
      data.articleID: data,
    };

    return _favBox.putAll(_insertMap);
  }

  Future<void> deleteFromFavBox(ArticlesModel data) async {
    return _favBox.delete(data.articleID);
  }

  Box<ArticlesModel> get favBox => _favBox;

  List<ArticlesModel> get fetchFromFavBox => _favBox.values.toList();
}
