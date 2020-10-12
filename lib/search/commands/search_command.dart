import 'package:experiments_with_web/app_level/commands/base_command.dart';
import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/models/cached_searches/cached_searches.dart';
import 'package:experiments_with_web/app_level/services/searches/search_operations.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/change_notifier.dart';
import 'package:experiments_with_web/search/string_search.dart';

import '../../locator.dart';

class SearchCommand extends GenericNotifier with BaseCommand {
  SearchCommand() {
    _articles = _articleIDList;
  }

  List<String> showSearchResults(String searchTerm) {
    _searchedResults = StringSearch(_articles, searchTerm).relevantResults();

    // CACHED RESULTS
    print('Cache>>> ${_cachedPhrases.toString()}');
    final cachedResult = isTermInCache(searchTerm);

    if (cachedResult.isNotEmpty) {
      print('FROM CACHE >>>> ${cachedResult.first.toJson()}');
      _searchedResults.add(cachedResult.first.articleName);
    }

    notify();
    return _searchedResults;
  }

  List<String> get searchedResults => _searchedResults;

  // ************************** INTERNALS

  List<String> _articles;

  List<String> get _articleIDList {
    var articles = <String>[];

    OptionsModel.options().forEach((item) {
      articles.add(item.articleName);
    });

    return articles;
  }

  List<String> get _cachedPhrases {
    var phrases = <String>[];

    _searchOps.fetchFromCacheSearchBox.forEach((item) {
      phrases.add(item.phrase);
    });

    return phrases;
  }

  List<CachedSearches> isTermInCache(String searchTerm) {
    final cachedData = _searchOps.cacheSearchBox.values
        .where((item) => item.phrase == searchTerm)
        .toList();
    return cachedData;
  }

  List<String> _searchedResults = [];

  final _searchOps = locator<SearchOperations>();
}
