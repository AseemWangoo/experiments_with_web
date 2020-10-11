import 'package:experiments_with_web/app_level/commands/base_command.dart';
import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/models/articles/articles.dart';

class SearchResultCommand extends BaseCommand {
  SearchResultCommand() {
    _combinedInputList;
  }

  void tap(String result) {
    print('You clicked $result');
    var article =
        _combinedInputList.where((item) => item.articleName == result).first;

    print(article.toJson());
  }

  List<ArticlesModel> get _combinedInputList => OptionsModel.options();
}
