import 'package:experiments_with_web/app_level/commands/base_command.dart';
import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/models/articles/articles.dart';
import 'package:experiments_with_web/app_level/services/navigation/navigation.dart';

import '../../locator.dart';

class SearchResultCommand extends BaseCommand {
  SearchResultCommand() {
    _combinedInputList;
  }

  void tap(String result) {
    print('You clicked $result');
    var article =
        _combinedInputList.where((item) => item.articleName == result).first;

    print(article.toJson());

    _navTo(article.articleRoute);
  }

  // ************************** INTERNALS

  void _navTo(String route) {
    _navigatorService.nav.pushNamed(route);
  }

  List<ArticlesModel> get _combinedInputList => OptionsModel.options();
  final _navigatorService = locator<NavigationService>();
}
