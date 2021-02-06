import 'package:experiments_with_web/bloc_example/api/github.api.dart';
import 'package:experiments_with_web/bloc_example/bloc/search.bloc.dart';
import 'package:experiments_with_web/bloc_example/bloc/states.bloc.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:test/test.dart' show TypeMatcher;

class MockGithubSearchImpl extends Mock implements GithubApi {}

void main() {
  SearchBloc searchBloc;
  MockGithubSearchImpl mockGithubSearch;

  setUp(() {
    mockGithubSearch = MockGithubSearchImpl();
    searchBloc = SearchBloc(mockGithubSearch);
  });

  tearDown(() {
    searchBloc?.dispose();
  });

  group('Search bloc', () {
    test('throws AssertionError if contract is null', () {
      expect(
        () => SearchBloc(null),
        throwsA(isAssertionError),
      );
    });

    test('initial state should be NoTerm', () async {
      await expectLater(searchBloc.state, emitsInOrder([noTerm]));
    });

    test('hardcoded empty term', () async {
      expect(searchBloc.state, emitsInOrder([noTerm, empty]));
      searchBloc.onTextChanged.add('');

      /// OR

      // scheduleMicrotask(() {
      //   searchBloc.onTextChanged.add('');
      // });

      // expect(
      //   searchBloc.state,
      //   emitsInOrder([noTerm, empty]),
      // );
    });

    test('api returns results', () async {
      final term = 'aseem';

      when(searchBloc.api.search(term)).thenAnswer((_) async {
        return SearchResult([SearchResultItem('aseem wangoo', 'xyz', 'abc')]);
      });

      expect(searchBloc.state, emitsInOrder([noTerm, loading, populated]));
      searchBloc.onTextChanged.add(term);
    });

    test('emit empty state if no results', () async {
      final term = 'aseem';

      when(searchBloc.api.search(term)).thenAnswer(
        (_) async => SearchResult([]),
      );

      expect(searchBloc.state, emitsInOrder([noTerm, loading, empty]));
      searchBloc.onTextChanged.add(term);
    });

    test('emit error state if API is down', () async {
      final term = 'aseem';

      when(searchBloc.api.search(term)).thenThrow(Exception());

      expect(searchBloc.state, emitsInOrder([noTerm, loading, error]));
      searchBloc.onTextChanged.add(term);
    });

    test('stream is closed', () async {
      when(searchBloc.dispose());

      expect(searchBloc.state, emitsInOrder([noTerm, emitsDone]));
    });
  });
}

const noTerm = TypeMatcher<SearchNoTerm>();
const loading = TypeMatcher<SearchLoading>();
const empty = TypeMatcher<SearchEmpty>();
const populated = TypeMatcher<SearchPopulated>();
const error = TypeMatcher<SearchError>();

// Run the test
// flutter test test/bloc_example/search_bloc_test.dart
// https://github.com/ResoCoder/flutter-tdd-clean-architecture-course/tree/master/test/features/number_trivia/presentation/bloc
// https://medium.com/flutter-community/unit-testing-with-bloc-b94de9655d86
// https://github.com/ReactiveX/rxdart/issues/169
