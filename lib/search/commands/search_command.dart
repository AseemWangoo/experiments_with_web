import 'package:experiments_with_web/app_level/commands/base_command.dart';

class SearchCommand extends BaseCommand {
  void showSearchResults(String searchTerm) {
    print('You searched >>> $searchTerm');
  }
}
