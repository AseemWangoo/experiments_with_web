import 'package:experiments_with_web/app_level/utilities/bloc/bloc_event_state.component.dart';
import 'package:experiments_with_web/bloc_example/bloc/events.bloc.dart';
import 'package:experiments_with_web/bloc_example/bloc/states.bloc.dart';
import 'package:experiments_with_web/bloc_example/contract/github.contract.dart';

import 'package:rxdart/rxdart.dart';

class SearchBloc extends BlocEventStateBase<SearchEvent, SearchState> {
  SearchBloc(this.api)
      : assert(api != null),
        super(initState: SearchNoTerm()) {
    _helpers = _Internals(api);
  }

  final GithubSearchContract api;

  @override
  Stream<SearchState> eventHandler(
    SearchEvent event,
    SearchState currentState,
  ) async* {
    try {
      switch (event.eventType) {
        case Events.init:
          // Unused
          break;

        case Events.typing:
          yield* _helpers.eventTyping(event);
          break;
      }
    } catch (exc) {
      yield SearchError();
    }
  }

  // INTERNALS
  _Internals _helpers;
}

class _Internals {
  _Internals(this.api);

  final GithubSearchContract api;

  Stream<SearchState> eventTyping(SearchEvent event) async* {
    final term = event.searchTerm;

    if (term.isEmpty) {
      yield SearchNoTerm();
    } else {
      // final streamOfResult = Rx.fromCallable(() => api.search(term));
      // streamOfResult.map((result) => result.isEmpty);
      yield SearchFetching();
    }
  }
}
