import 'package:experiments_with_web/app_level/commands/base_command.dart';

class SearchResultCommand extends BaseCommand {
  void tap(String result) {
    print('You clicked $result');
  }
}
