// import 'package:experiments_with_web/bloc_example/api/github.api.dart';
// import 'package:experiments_with_web/bloc_example/bloc/events.bloc.dart';
// import 'package:experiments_with_web/bloc_example/bloc/search.bloc.dart';
// import 'package:experiments_with_web/bloc_example/bloc/states.bloc.dart';

// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// class MockGithubSearchImpl extends Mock implements GithubApi {}

// void main() {
//   SearchBloc searchBloc;
//   MockGithubSearchImpl mockGithubSearch;

//   setUp(() {
//     mockGithubSearch = MockGithubSearchImpl();
//     searchBloc = SearchBloc(mockGithubSearch);
//   });

//   group('Search bloc', () {
//     test('throws AssertionError if contract is null', () {
//       expect(
//         () => SearchBloc(null),
//         throwsA(isAssertionError),
//       );
//     });

//     test('initial state should be NoTerm', () {
//       expect(searchBloc.initState.state, equals(SearchNoTerm().state));
//     });
//     test('check for empty term', () async {
//       searchBloc.emitEvent(
//         SearchEvent(eventType: Events.typing, searchTerm: ''),
//       );

//       // expect(
//       //   Stream.fromIterable([1, 2, 3]),
//       //   emitsInOrder([1, 2, 3, emitsDone]),
//       // );

//       await expectLater(searchBloc.state, emits(SearchNoTerm()));
//     });

//     test('non-empty term and begin loading', () async {
//       searchBloc.emitEvent(
//         SearchEvent(eventType: Events.typing, searchTerm: 'x'),
//       );

//       await expectLater(searchBloc.state, emits(SearchFetching()));
//     });
//   });
// }

// // Run the test
// // flutter test test/bloc_example/search_bloc_test.dart
// // https://github.com/ResoCoder/flutter-tdd-clean-architecture-course/tree/master/test/features/number_trivia/presentation/bloc
// // https://medium.com/flutter-community/unit-testing-with-bloc-b94de9655d86
// // https://github.com/ReactiveX/rxdart/issues/169
