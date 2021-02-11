import 'package:experiments_with_web/bloc_example/api/github.api.dart';

abstract class GithubSearchContract {
  Future<SearchResult> search(String term);
}
