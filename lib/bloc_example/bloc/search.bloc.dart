import 'package:experiments_with_web/bloc_example/bloc/states.bloc.dart';
import 'package:experiments_with_web/bloc_example/contract/github.contract.dart';

import 'package:rxdart/rxdart.dart';

class SearchBloc {
  factory SearchBloc(GithubSearchContract api) {
    // If used behavior subject, it shows the previous result
    final onTextChanged = PublishSubject<String>();

    final state = onTextChanged
        // If the text has not changed, do not perform a new search
        .distinct()
        // Wait for the user to stop typing for 500ms before running a search
        .debounceTime(const Duration(milliseconds: 500))
        // Call the Github api with the given search term.
        // If another search term is entered, switchMap will ensure
        // the previous search is discarded
        .switchMap<SearchState>((String term) => _helpers.eventTyping(term))
        // The initial state to deliver to the screen.
        .startWith(SearchNoTerm());

    return SearchBloc._(api, onTextChanged, state);
  }

  /// Sink exposed to UI
  final Sink<String> onTextChanged;

  /// State exposed to UI
  final Stream<SearchState> state;

  SearchBloc._(this.api, this.onTextChanged, this.state)
      : assert(api != null),
        super() {
    _helpers = _Internals(api);
  }

  final GithubSearchContract api;

  void dispose() {
    onTextChanged?.close();
  }

  // INTERNALS
  static _Internals _helpers;
}

class _Internals {
  _Internals(this.api);

  final GithubSearchContract api;

  Stream<SearchState> eventTyping(String term) async* {
    // print('Searching for >>> $term');

    if (term.isEmpty) {
      yield SearchEmpty();
    } else {
      yield* Rx.fromCallable(() => api.search(term))
          .map((result) =>
              result.isEmpty ? SearchEmpty() : SearchPopulated(result))
          .startWith(SearchLoading())
          .onErrorReturn(SearchError());
    }
  }
}
