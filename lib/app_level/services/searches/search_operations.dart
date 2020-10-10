import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/models/cached_searches/cached_searches.dart';

import 'package:hive/hive.dart';

class SearchOperations {
  final _searchBox = Hive.box<CachedSearches>(HiveBoxes.searchesBox);

  Future<void> addToFavBox(CachedSearches data) async {
    return _searchBox.put(data.phrase, data);
  }

  Box<CachedSearches> get favBox => _searchBox;

  List<CachedSearches> get fetchFromFavBox => _searchBox.values.toList();
}
