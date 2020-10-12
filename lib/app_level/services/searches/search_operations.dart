import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/models/cached_searches/cached_searches.dart';

import 'package:hive/hive.dart';

class SearchOperations {
  final _searchBox = Hive.box<CachedSearches>(HiveBoxes.searchesBox);

  Future<void> addToCache(CachedSearches data) async {
    final exists = checkIfExistsInCache(data);
    if (exists) {
      final val = _searchBox.get(data.phrase);
      data..occurences = val.occurences + 1;
      print('Data to be inserted ${data.toJson()}');
      return _searchBox.put(data.phrase, data);
    }

    return _searchBox.put(data.phrase, data);
  }

  bool checkIfExistsInCache(CachedSearches data) {
    final val = _searchBox.get(data.phrase);
    if (val == null) {
      return false;
    }
    return true;
  }

  Box<CachedSearches> get cacheSearchBox => _searchBox;

  List<CachedSearches> get fetchFromCacheSearchBox =>
      _searchBox.values.toList();
}
