import 'package:experiments_with_web/search/algo/front_back_search.dart';
import 'package:experiments_with_web/search/algo/string_search.dart';

void main() {
  // testFrontBackSearch();
  testStringSearch();
}

void testFrontBackSearch() {
  // var inputList = <int>[10, 20, 80, 30, 60, 50, 12];

  // var searchTerm = 30;

  var inputList = <String>['Hey', 'there', 'am', 'was', 'busy'];
  var searchTerm = 'wasm';

  var hasMatched = FrontBackSearch(inputList, searchTerm).isSearchFound;
  print('>>> $searchTerm present : $hasMatched');
}

void testStringSearch() {
  var stringList = <String>['Hey', 'there', 'am', 'ere', 'busy'];
  var stringSearchTerm = 'ey';

  var results = StringSearch(stringList, stringSearchTerm).relevantResults();
  print('>>> ${results.length} results found for $stringSearchTerm');

  for (var item in results) {
    print('Search result $item');
  }
}
