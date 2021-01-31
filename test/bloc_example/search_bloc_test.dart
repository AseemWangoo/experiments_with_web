import 'package:experiments_with_web/bloc_example/api/github.api.dart';
import 'package:experiments_with_web/bloc_example/bloc/search.bloc.dart';
import 'package:experiments_with_web/bloc_example/bloc/states.bloc.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGithubSearchImpl extends Mock implements GithubApi {}

void main() {
  SearchBloc searchBloc;
  MockGithubSearchImpl mockGithubSearch;

  setUp(() {
    mockGithubSearch = MockGithubSearchImpl();
    searchBloc = SearchBloc(mockGithubSearch);
  });

  group('Search bloc', () {
    test('initial state should be NoTerm', () {
      expect(searchBloc.initState.state, equals(SearchState.noTerm().state));
    });
  });
}

// Run the test
// flutter test test/bloc_example/search_bloc_test.dart
