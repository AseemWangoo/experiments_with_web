import 'package:experiments_with_web/search/front_back_search.dart';
import 'package:experiments_with_web/search/string_search.dart';

void main() {
  // var inputList = <int>[10, 20, 80, 30, 60, 50, 12];

  // var searchTerm = 30;

  var inputList = <String>['Hey', 'there', 'am', 'was', 'busy'];
  var searchTerm = 'wasm';

  var hasMatched = FrontBackSearch(inputList, searchTerm).isSearchFound;
  print('>>> $searchTerm present : $hasMatched');

  var stringList = <String>['Hey', 'there', 'am', 'ere', 'busy'];
  var stringSearchTerm = 'her';

  var results = StringSearch(stringList, stringSearchTerm).relevantResults();
  print('>>> ${results.length} results found for $stringSearchTerm');
}
