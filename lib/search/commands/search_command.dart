import 'package:experiments_with_web/app_level/commands/base_command.dart';
import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/models/articles/articles.dart';
import 'package:experiments_with_web/search/string_search.dart';

class SearchCommand extends BaseCommand {
  SearchCommand() {
    _combinedInputList;
    _articles = _articleIDList;
  }

  List<String> showSearchResults(String searchTerm) {
    return StringSearch(_articles, searchTerm).relevantResults();
  }

  List<String> _articles;

  List<ArticlesModel> get _combinedInputList => OptionsModel.options();

  List<String> get _articleIDList {
    var articles = <String>[];

    OptionsModel.options().forEach((item) {
      articles.add(item.articleName);
    });

    return articles;
  }
}
