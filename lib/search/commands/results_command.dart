import 'package:experiments_with_web/app_level/commands/base_command.dart';
import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/models/articles/articles.dart';
import 'package:experiments_with_web/app_level/models/cached_searches/cached_searches.dart';
import 'package:experiments_with_web/app_level/services/navigation/navigation.dart';
import 'package:experiments_with_web/app_level/services/searches/search_operations.dart';

import '../../locator.dart';

class SearchResultCommand extends BaseCommand {
  SearchResultCommand() {
    _combinedInputList;
  }

  void tap(String result, String searchTerm) {
    var article =
        _combinedInputList.where((item) => item.articleName == result).first;

    // INSERT IN CACHE
    _insertInCache(article, searchTerm);

    _navTo(article.articleRoute);
  }

  // ************************** INTERNALS

  void _navTo(String route) {
    _navigatorService.nav.pushNamed(route);
  }

  List<ArticlesModel> get _combinedInputList => OptionsModel.options();
  final _navigatorService = locator<NavigationService>();
  final _searchOps = locator<SearchOperations>();

  void _insertInCache(ArticlesModel model, String searchTerm) {
    final data = CachedSearches(
      articleName: model.articleName,
      clickedResult: model.articleRoute,
      occurences: 1,
      phrase: searchTerm,
      timestamp: DateTime.now(),
    );
    _searchOps.addToCache(data);
  }
}
